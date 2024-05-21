import { DataTable } from '@/Components/table/DataTable'
import { Button } from '@/Components/ui/button'
import Authenticated from '@/Layouts/AuthenticatedLayout'
import { PageProps } from '@/types'
import { Head } from '@inertiajs/react'
import { DownloadIcon } from '@radix-ui/react-icons'
import { ColumnDef } from '@tanstack/react-table'

export default function ReportIndexPage({
  auth,
  subjects
}: PageProps & { subjects: any }) {
  const columns: ColumnDef<any, any>[] = [
    {
      accessorKey: 'subject',
      header: 'Perizinan'
    },
    {
      accessorKey: 'approved_total',
      header: 'Disetujui'
    },
    {
      accessorKey: 'corrective_total',
      header: 'Ditolak'
    },
    {
      accessorKey: 'total',
      header: 'Total'
    }
  ]
  return (
    <Authenticated
      user={auth.user}
      header={
        <div className="flex items-center justify-between gap-2">
          <h2 className="text-xl font-semibold leading-tight text-gray-800 dark:text-gray-200">
            Laporan
          </h2>
          <div className="flex items-center gap-2">
            <a href={route('reports.download')}>
              <Button type="button">
                <DownloadIcon className="w-5 h-5" />
                Unduh
              </Button>
            </a>
          </div>
        </div>
      }
    >
      <Head title="Laporan" />

      <div className="px-8 pb-8 mx-auto max-w-7xl">
        <DataTable
          columns={columns}
          data={subjects}
          name="reports"
          searchParam="subject"
          pageSizeOptions={[50, 100, 200, 500]}
        />
      </div>
    </Authenticated>
  )
}
