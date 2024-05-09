import { DataTable } from '@/Components/table/DataTable'
import { DataTableRowActions } from '@/Components/table/DataTableRowActions'
import { Button } from '@/Components/ui/button'
import { Checkbox } from '@/Components/ui/checkbox'
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout'
import { Instance, PageProps } from '@/types'
import { Head, Link, router } from '@inertiajs/react'
import {
  CaretSortIcon,
  CheckCircledIcon,
  CrossCircledIcon,
  PlusIcon
} from '@radix-ui/react-icons'
import { ColumnDef } from '@tanstack/react-table'
import { useEffect } from 'react'
import { toast } from 'sonner'

function generateColumn({
  appUrl
}: {
  appUrl: string
}): ColumnDef<Instance, any>[] {
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
      accessorKey: 'image',
      header: 'Image',
      cell: ({ row }) => {
        const url = row.original.image
          ? appUrl + '/storage/instances/' + row.original.image
          : 'https://via.placeholder.com/150'
        return (
          <div className="object-cover bg-contain">
            <img
              src={url}
              alt={row.original.name}
              className="object-cover object-center transition-all duration-300 h-28 rounded-xl w-28"
            />
          </div>
        )
      }
    },
    {
      accessorKey: 'name',
      header({ column }) {
        return (
          <Button
            variant="ghost"
            onClick={() =>
              column.toggleSorting(column.getIsSorted() === 'asc')
            }
          >
            Name
            <CaretSortIcon className="w-4 h-4 ml-2" />
          </Button>
        )
      },
      cell: ({ row }) => (
        <Link
          href={row.original.website}
          className="text-blue-500 hover:underline"
        >
          {row.original.name}
        </Link>
      )
    },
    {
      accessorKey: 'kepsek',
      header({ column }) {
        return (
          <Button
            variant="ghost"
            onClick={() =>
              column.toggleSorting(column.getIsSorted() === 'asc')
            }
          >
            Kepsek
            <CaretSortIcon className="w-4 h-4 ml-2" />
          </Button>
        )
      }
    },
    {
      accessorKey: 'email',
      header({ column }) {
        return (
          <Button
            variant="ghost"
            onClick={() =>
              column.toggleSorting(column.getIsSorted() === 'asc')
            }
          >
            Email
            <CaretSortIcon className="w-4 h-4 ml-2" />
          </Button>
        )
      }
    },
    {
      accessorKey: 'is_active',
      header(props) {
        return <div className="text-center">Active</div>
      },
      cell: ({ row }) => (
        <div className="flex items-center justify-center">
          {row.original.is_active ? (
            <CheckCircledIcon className="w-5 h-5 text-green-500" />
          ) : (
            <CrossCircledIcon className="w-5 h-5 text-red-500" />
          )}
        </div>
      )
    },
    {
      accessorKey: 'created_at',
      header: 'Created At',
      cell: ({ row }) => (
        <time dateTime={row.original.created_at}>
          {new Date(row.original.created_at).toLocaleDateString(
            'id-ID',
            {
              day: 'numeric',
              month: 'long',
              year: 'numeric'
            }
          )}
        </time>
      )
    },
    {
      id: 'actions',
      header() {
        return <div className="text-center">Actions</div>
      },
      cell: ({ row }) => (
        <DataTableRowActions row={row} name="instances" />
      )
    }
  ]
}

export default function IndexInstancePage({
  auth,
  instances,
  flash,
  appUrl
}: PageProps & {
  instances: Instance[]
}) {
  const columns = generateColumn({ appUrl })

  useEffect(() => {
    if (flash?.success) {
      toast.success(flash.success)
    }

    if (flash?.error) {
      toast.error(flash.error)
    }
  }, [flash])

  return (
    <AuthenticatedLayout
      user={auth.user}
      header={
        <div className="flex items-center justify-between gap-2">
          <h2 className="text-xl font-semibold leading-tight text-gray-800 dark:text-gray-200">
            Instances ( {instances.length} )
          </h2>
          <Button
            className="flex items-center gap-2"
            onClick={() => router.visit('/instances/create')}
          >
            <PlusIcon className="w-5 h-5" />
            Create new
          </Button>
        </div>
      }
    >
      <Head title="Instances" />

      <div className="px-8 mx-auto max-w-7xl">
        <DataTable columns={columns} data={instances} />
      </div>
    </AuthenticatedLayout>
  )
}

// interface DataTableProps<TData, TValue> {
//   columns: ColumnDef<TData, TValue>[]
//   data: TData[]
// }

// function DataTable<TData, TValue>({
//   columns,
//   data
// }: DataTableProps<TData, TValue>) {
//   const table = useReactTable({
//     data,
//     columns,
//     getCoreRowModel: getCoreRowModel()
//   })

//   return (
//     <div className="border rounded-md">
//       <Table>
//         <TableHeader>
//           {table.getHeaderGroups().map((headerGroup) => (
//             <TableRow key={headerGroup.id}>
//               {headerGroup.headers.map((header) => {
//                 return (
//                   <TableHead key={header.id}>
//                     {header.isPlaceholder
//                       ? null
//                       : flexRender(
//                           header.column.columnDef.header,
//                           header.getContext()
//                         )}
//                   </TableHead>
//                 )
//               })}
//             </TableRow>
//           ))}
//         </TableHeader>
//         <TableBody>
//           {table.getRowModel().rows?.length ? (
//             table.getRowModel().rows.map((row) => (
//               <TableRow
//                 key={row.id}
//                 data-state={row.getIsSelected() && 'selected'}
//               >
//                 {row.getVisibleCells().map((cell) => (
//                   <TableCell key={cell.id}>
//                     {flexRender(
//                       cell.column.columnDef.cell,
//                       cell.getContext()
//                     )}
//                   </TableCell>
//                 ))}
//               </TableRow>
//             ))
//           ) : (
//             <TableRow>
//               <TableCell
//                 colSpan={columns.length}
//                 className="h-24 text-center"
//               >
//                 No results.
//               </TableCell>
//             </TableRow>
//           )}
//         </TableBody>
//       </Table>
//     </div>
//   )
// }
