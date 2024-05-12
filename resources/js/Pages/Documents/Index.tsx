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
import {
  DownloadIcon,
  EnterIcon,
  ExitIcon,
  PlusIcon
} from '@radix-ui/react-icons'
import { ColumnDef } from '@tanstack/react-table'
import axios from 'axios'
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
      header: 'Number'
    },
    {
      accessorKey: 'from',
      header: 'From'
    },
    {
      accessorKey: 'instance_name',
      header: 'Instance'
    },
    {
      accessorKey: 'subject',
      header: 'Subject'
    },
    {
      accessorKey: 'next_action',
      header: 'Next Action'
    },
    {
      accessorKey: 'corrective_action',
      header: 'Corrective Action'
    },
    {
      accessorKey: 'description',
      header: 'Description'
    },
    {
      accessorKey: 'phone',
      header: 'Phone'
    },
    {
      accessorKey: 'issue_date',
      header: 'Issue Date'
    },
    {
      accessorKey: 'verification_date',
      header: 'Verification Date'
    },
    {
      id: 'actions',
      header() {
        return <div className="text-center">Actions</div>
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
            {doc_type.charAt(0).toUpperCase() +
              doc_type.slice(1) +
              ' '}
            Documents
          </h2>
          <div className="flex items-center gap-2">
            <Button
              variant="secondary"
              onClick={async () => {
                const res = await axios.get(
                  route('documents.file.export', {
                    doc_type: doc_type
                  })
                )
                const filename =
                  res.headers['content-disposition'].split(
                    'filename='
                  )[1]
                const url = window.URL.createObjectURL(
                  new Blob([res.data])
                )
                const link = document.createElement('a')
                link.href = url
                link.setAttribute('download', filename)
                document.body.appendChild(link)
                link.click()
                window.URL.revokeObjectURL(url)
                toast.success('Exported successfully')
              }}
            >
              <DownloadIcon className="w-5 h-5" />
              Export
            </Button>
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
              Create new
            </Button>
          </div>
        </div>
      }
    >
      <Head title="Documents" />

      <div className="px-8 mx-auto max-w-7xl">
        <Tabs defaultValue="incoming">
          <TabsList>
            <TabsTrigger value="incoming">
              Incoming <EnterIcon className="ml-2" />
            </TabsTrigger>
            <TabsTrigger value="outgoing">
              Outgoing
              <ExitIcon className="ml-2" />
            </TabsTrigger>
          </TabsList>
          <TabsContent value="incoming">
            <DataTable
              columns={columns}
              data={documents.filter(
                (doc) => doc.type === 'incoming'
              )}
              name="documents"
              doc_type="central"
            />
          </TabsContent>
          <TabsContent value="outgoing">
            <DataTable
              columns={columns}
              data={documents.filter(
                (doc) => doc.type === 'outgoing'
              )}
              name="documents"
              doc_type="east"
            />
          </TabsContent>
        </Tabs>
      </div>
    </Authenticated>
  )
}
