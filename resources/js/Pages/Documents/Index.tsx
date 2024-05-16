import { DataTable } from '@/Components/table/DataTable'
import { DataTableRowActions } from '@/Components/table/DataTableRowActions'
import { Button } from '@/Components/ui/button'
import { Checkbox } from '@/Components/ui/checkbox'
import Authenticated from '@/Layouts/AuthenticatedLayout'
import { Document, PageProps } from '@/types'
import { Head, router } from '@inertiajs/react'
import { DownloadIcon, PlusIcon } from '@radix-ui/react-icons'
import { ColumnDef } from '@tanstack/react-table'
import { useEffect, useState } from 'react'
import { toast } from 'sonner'
import { ImportForm } from './_import_form'

function generateColumn({
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
      header: 'Pemohon'
    },
    {
      accessorKey: 'instance_name',
      header: 'Dinas'
    },
    {
      accessorKey: 'subject',
      header: 'Perizinan'
    },
    {
      accessorKey: 'description',
      header: 'Keterangan'
    },
    {
      accessorKey: 'phone',
      header: 'Telepon'
    },
    {
      accessorKey: 'issue_date',
      header: 'Tanggal Terbit'
    },
    {
      accessorKey: 'verification_date',
      header: 'Tanggal Verifikasi'
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

export default function DocumentsPage({
  appUrl,
  auth,
  doc_type,
  documents,
  flash
}: PageProps & {
  documents: Document[]
  doc_type: string
}) {
  const [importOpen, setImportOpen] = useState(false)
  const columns = generateColumn({ appUrl })

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
  return (
    <Authenticated
      user={auth.user}
      header={
        <div className="flex items-center justify-between gap-2">
          <h2 className="text-xl font-semibold leading-tight text-gray-800 dark:text-gray-200">
            Surat Masuk
            {doc_type === 'central' ? ' Pusat' : ' Timur'}
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
      <Head title="Documents" />

      <div className="px-8 pb-8 mx-auto max-w-7xl">
        <DataTable
          columns={columns}
          data={documents}
          name="documents"
          doc_type="central"
          searchParam="from"
        />
      </div>
    </Authenticated>
  )
}
