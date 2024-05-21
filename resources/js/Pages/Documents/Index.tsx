import { DataTable } from '@/Components/table/DataTable'
import { DataTableRowActions } from '@/Components/table/DataTableRowActions'
import { Button } from '@/Components/ui/button'
import { Checkbox } from '@/Components/ui/checkbox'
import {
  Tabs,
  TabsContent,
  TabsList,
  TabsTrigger
} from '@/Components/ui/tabs'
import Authenticated from '@/Layouts/AuthenticatedLayout'
import { Document, PageProps } from '@/types'
import { Head, router } from '@inertiajs/react'
import { DownloadIcon, PlusIcon } from '@radix-ui/react-icons'
import { ColumnDef } from '@tanstack/react-table'
import { useEffect, useState } from 'react'
import { toast } from 'sonner'
import { ImportForm } from './_import_form'

function generateAllColumn({
  appUrl
}: {
  appUrl: string
}): ColumnDef<Document, any>[] {
  return [
    {
      id: 'select',
      header: ({ table }) => (
        <Checkbox
          checked={
            table.getIsAllPageRowsSelected() ||
            (table.getIsSomePageRowsSelected() && 'indeterminate')
          }
          onCheckedChange={(value) =>
            table.toggleAllPageRowsSelected(!!value)
          }
          aria-label="Select all"
          className="translate-y-[2px]"
        />
      ),
      cell: ({ row }) => (
        <Checkbox
          checked={row.getIsSelected()}
          onCheckedChange={(value) => row.toggleSelected(!!value)}
          aria-label="Select row"
          className="translate-y-[2px]"
        />
      ),
      enableSorting: false,
      enableHiding: false
    },
    {
      accessorKey: 'number',
      header: 'No.'
    },
    {
      accessorKey: 'from',
      header: 'Pemohon',
      cell(props) {
        const text: string = props.getValue()
        if (text.length > 20) {
          return text.slice(0, 20) + '...'
        } else {
          return text
        }
      }
    },
    {
      accessorKey: 'phone',
      header: 'Telepon'
    },
    {
      accessorKey: 'instance_name',
      header: 'Dinas'
    },
    {
      accessorKey: 'subject',
      header: 'Perizinan',
      cell(props) {
        const text: string = props.getValue()
        if (text.length > 20) {
          return text.slice(0, 20) + '...'
        } else {
          return text
        }
      }
    },
    {
      accessorKey: 'description',
      header: 'Keterangan'
    },
    {
      id: 'is_corrective',
      header: 'Dikembalikan',
      cell: ({ row }) => {
        const status = row.original.corrective_action ? 'Ya' : 'Tidak'
        return (
          <div className="flex items-center justify-center">
            <i
              className={`text-${status === 'Ya' ? 'green' : 'red'}-500`}
            >
              {status}
            </i>
          </div>
        )
      }
    },
    {
      accessorKey: 'issue_date',
      header: 'Tanggal Terbit',
      filterFn: 'dateRangeFilter'
    },
    {
      accessorKey: 'verification_date',
      header: 'Tanggal Verifikasi',
      filterFn: 'dateRangeFilter'
    },
    {
      id: 'actions',
      header() {
        return <div className="text-center">Aksi</div>
      },
      cell: ({ row }) => (
        <DataTableRowActions row={row} name="documents" />
      )
    }
  ]
}

function generateSummaryColumn(): ColumnDef<any, any>[] {
  return [
    {
      accessorKey: 'from',
      header: 'Pemohon'
    },
    {
      accessorKey: 'subject',
      header: 'Perizinan'
    },
    {
      accessorKey: 'corrective_action_count',
      header: 'Dikembalikan',
      cell(props) {
        const data = props.getValue()
        if (data === 0) {
          return '-'
        } else {
          return data + ' kali'
        }
      }
    },
    {
      accessorKey: 'corrective_action_last_date',
      header: 'Tanggal Terakhir Perbaikan',
      cell(props) {
        const data = props.getValue()
        if (data) {
          const date = new Date(data)
          // format to dd MMM yyyy HH:mm
          return date.toLocaleString('id-ID', {
            day: 'numeric',
            month: 'short',
            year: 'numeric',
            hour: '2-digit',
            minute: '2-digit'
          })
        } else {
          return '-'
        }
      }
    }
  ]
}

export default function DocumentsPage({
  appUrl,
  auth,
  doc_type,
  documents,
  summary,
  flash
}: PageProps & {
  documents: Document[]
  doc_type: string
  summary: any
}) {
  const [importOpen, setImportOpen] = useState(false)
  const allColumns = generateAllColumn({ appUrl })
  const sumColumns = generateSummaryColumn()

  useEffect(() => {
    setImportOpen(false)
    toast.dismiss()
    if (flash?.success) {
      toast.success(flash.success)
    }

    if (flash?.error) {
      toast.error(flash.error)
    }
  }, [flash])
  const doc_length = documents.length
  const type =
    doc_type === 'central'
      ? ` Pusat (${doc_length})`
      : ` Timur (${doc_length})`

  return (
    <Authenticated
      user={auth.user}
      header={
        <div className="flex items-center justify-between gap-2">
          <h2 className="text-xl font-semibold leading-tight text-gray-800 dark:text-gray-200">
            Surat Masuk
            {type}
          </h2>
          <div className="flex items-center gap-2">
            <a href={route('documents.file.export')}>
              <Button variant="secondary" type="button">
                <DownloadIcon className="w-5 h-5" />
                Export
              </Button>
            </a>
            <ImportForm
              doc_type={doc_type}
              setImportOpen={setImportOpen}
              importOpen={importOpen}
            />
            <Button
              className="flex items-center gap-2"
              onClick={() =>
                router.visit(`/documents/create?type=${doc_type}`)
              }
            >
              <PlusIcon className="w-5 h-5" />
              Buat Baru
            </Button>
          </div>
        </div>
      }
    >
      <Head title={`Surat Masuk ${type}`} />

      <div className="px-8 pb-8 mx-auto max-w-7xl">
        <Tabs defaultValue="all">
          <TabsList className="grid w-full grid-cols-2 mb-4">
            <TabsTrigger value="all">Semua</TabsTrigger>
            <TabsTrigger value="summary">Ringkasan</TabsTrigger>
          </TabsList>
          <TabsContent value="all">
            <DataTable
              columns={allColumns}
              data={documents}
              name="documents"
              doc_type="central"
              searchParam="from"
            />
          </TabsContent>
          <TabsContent value="summary">
            <DataTable
              columns={sumColumns}
              data={summary.filter(
                (i: any) => i.corrective_action_count > 0
              )}
              name="documents"
              doc_type="central"
              searchParam="from"
            />
          </TabsContent>
        </Tabs>
      </div>
    </Authenticated>
  )
}
