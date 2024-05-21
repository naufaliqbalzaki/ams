import { DataTable } from '@/Components/table/DataTable'
import { Badge } from '@/Components/ui/badge'
import { Button } from '@/Components/ui/button'
import Authenticated from '@/Layouts/AuthenticatedLayout'
import { PageProps } from '@/types'
import { Head, router } from '@inertiajs/react'
import { DownloadIcon } from '@radix-ui/react-icons'
import { ColumnDef } from '@tanstack/react-table'
import axios from 'axios'
import { useEffect } from 'react'
import { toast } from 'sonner'

function generateColumn({
  appUrl
}: {
  appUrl: string
}): ColumnDef<any, any>[] {
  return [
    {
      accessorKey: 'name',
      header: 'Nama File',
      cell(props) {
        if (props.row.index === 0) {
          return (
            <>
              {props.getValue()}
              <Badge className="ml-4 bg-green-500 text-foreground">
                Baru
              </Badge>
            </>
          )
        } else {
          return <>{props.getValue()}</>
        }
      }
    },
    {
      accessorKey: 'created_at',
      header: 'Tanggal Dibuat'
    },
    {
      accessorKey: 'size',
      header: 'Ukuran',
      cell(props) {
        return <span>{props.getValue() / 1000} KB</span>
      }
    },
    {
      accessorKey: 'action',
      header() {
        return <div className="text-center">Aksi</div>
      },
      cell(props) {
        return (
          <div className="flex items-center justify-center">
            <Button
              variant="ghost"
              type="button"
              className="bg-blue-500 bg-opacity-5"
              onClick={async () => {
                const res = await axios.get(
                  route('backups.download', props.row.original.name)
                )
                const url = window.URL.createObjectURL(
                  new Blob([res.data])
                )
                const link = document.createElement('a')
                link.href = url
                link.setAttribute('download', props.row.original.name)
                document.body.appendChild(link)
                link.click()
                window.URL.revokeObjectURL(url)
                toast.success('Berhasil mengunduh file.')
              }}
            >
              <DownloadIcon className="w-5 h-5 text-blue-500" />
            </Button>
          </div>
        )
      }
    }
  ]
}

export default function BackupIndexPage({
  auth,
  files,
  appUrl,
  flash
}: PageProps & { files: any[] }) {
  const columns = generateColumn({ appUrl })
  useEffect(() => {
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
            Backup
          </h2>
          <div className="flex items-center gap-2">
            <Button
              onClick={() => router.visit(route('backups.create'))}
            >
              Buat Backup
            </Button>
          </div>
        </div>
      }
    >
      <Head title="Backup" />

      <div className="px-8 pb-8 mx-auto max-w-7xl">
        <DataTable
          columns={columns}
          data={files}
          showToolbar={false}
        />
      </div>
    </Authenticated>
  )
}
