import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow
} from '@/Components/ui/table'
import { cn } from '@/lib/utils'
import {
  ColumnDef,
  ColumnFiltersState,
  FilterFn,
  SortingState,
  VisibilityState,
  flexRender,
  getCoreRowModel,
  getFacetedRowModel,
  getFacetedUniqueValues,
  getFilteredRowModel,
  getPaginationRowModel,
  getSortedRowModel,
  useReactTable
} from '@tanstack/react-table'
import { useEffect, useState } from 'react'
import { DataTablePagination } from './DataTablePagination'
import { DataTableToolbar } from './DataTableToolbar'

declare module '@tanstack/table-core' {
  interface FilterFns {
    dateRangeFilter: FilterFn<unknown>
  }
}
interface DataTableProps<TData, TValue> {
  columns: ColumnDef<TData, TValue>[]
  data: TData[]
  name?: 'documents' | 'instances' | 'reports'
  doc_type?: 'central' | 'east'
  searchParam?: string
  showToolbar?: boolean
  pageSizeOptions?: number[]
}

export const dateRangeFilter: FilterFn<any> = (
  row,
  columnId,
  value
) => {
  const date = new Date(row.getValue(columnId))
  const from = new Date(value.from)
  const to = new Date(value.to)
  if ((from || to) && !date) return false
  if (from && !to) {
    return date.getTime() >= from.getTime()
  } else if (!from && to) {
    return date.getTime() <= to.getTime()
  } else if (from && to) {
    return (
      date.getTime() >= from.getTime() &&
      date.getTime() <= to.getTime()
    )
  } else return true
}

dateRangeFilter.autoRemove

export function DataTable<TData, TValue>({
  columns,
  data,
  name,
  doc_type,
  searchParam,
  showToolbar = true,
  pageSizeOptions = [10, 20, 30, 40, 50, 100, 200, 500]
}: DataTableProps<TData, TValue>) {
  const [rowSelection, setRowSelection] = useState({})
  const [columnVisibility, setColumnVisibility] =
    useState<VisibilityState>({})
  const [columnFilters, setColumnFilters] =
    useState<ColumnFiltersState>([])
  const [sorting, setSorting] = useState<SortingState>([])

  const table = useReactTable({
    data,
    columns,
    state: {
      sorting,
      columnVisibility,
      rowSelection,
      columnFilters
    },
    filterFns: {
      dateRangeFilter: dateRangeFilter
    },
    enableRowSelection: true,
    onRowSelectionChange: setRowSelection,
    onSortingChange: setSorting,
    onColumnFiltersChange: setColumnFilters,
    onColumnVisibilityChange: setColumnVisibility,
    getCoreRowModel: getCoreRowModel(),
    getFilteredRowModel: getFilteredRowModel(),
    getPaginationRowModel: getPaginationRowModel(),
    getSortedRowModel: getSortedRowModel(),
    getFacetedRowModel: getFacetedRowModel(),
    getFacetedUniqueValues: getFacetedUniqueValues()
  })
  useEffect(() => {
    if (pageSizeOptions) {
      table.setPageSize(pageSizeOptions[0])
    }
  }, [table])
  let total = 0
  let approved = 0
  let corrective = 0
  if (name === 'reports') {
    data.map((item: any) => {
      console.log(item)
      approved = approved + item.approved_total
      corrective = corrective + item.corrective_total
      total = total + item.total
    })
  }
  return (
    <div className="space-y-4">
      {showToolbar && (
        <DataTableToolbar
          table={table}
          name={name}
          doc_type={doc_type}
          searchParam={searchParam}
        />
      )}
      <div className="border rounded-md">
        <Table>
          <TableHeader className="bg-emerald-500 bg-opacity-5">
            {table.getHeaderGroups().map((headerGroup) => (
              <TableRow key={headerGroup.id}>
                {headerGroup.headers.map((header) => {
                  return (
                    <TableHead
                      key={header.id}
                      colSpan={header.colSpan}
                    >
                      {header.isPlaceholder
                        ? null
                        : flexRender(
                            header.column.columnDef.header,
                            header.getContext()
                          )}
                    </TableHead>
                  )
                })}
              </TableRow>
            ))}
          </TableHeader>

          <TableBody>
            {table.getRowModel().rows?.length ? (
              <>
                {table.getRowModel().rows.map((row) => (
                  <TableRow
                    key={row.id}
                    data-state={row.getIsSelected() && 'selected'}
                  >
                    {row.getVisibleCells().map((cell) => (
                      <TableCell
                        key={cell.id}
                        className={cn(
                          parseInt(cell.row.id) % 2 === 0
                            ? 'bg-background'
                            : 'dark:bg-neutral-900 bg-neutral-100'
                        )}
                      >
                        {flexRender(
                          cell.column.columnDef.cell,
                          cell.getContext()
                        )}
                      </TableCell>
                    ))}
                  </TableRow>
                ))}
                {name == 'reports' && (
                  <TableRow>
                    <TableCell className="bg-opacity-50 bg-sky-500">
                      Total Keseluruhan
                    </TableCell>
                    <TableCell className="bg-opacity-50 bg-sky-500">
                      {approved}
                    </TableCell>
                    <TableCell className="bg-opacity-50 bg-sky-500">
                      {corrective}
                    </TableCell>
                    <TableCell className="bg-opacity-50 bg-sky-500">
                      {total}
                    </TableCell>
                  </TableRow>
                )}
              </>
            ) : (
              <TableRow>
                <TableCell
                  colSpan={columns.length}
                  className="h-24 text-center"
                >
                  Data tidak ditemukan
                </TableCell>
              </TableRow>
            )}
          </TableBody>
        </Table>
      </div>
      <DataTablePagination
        table={table}
        pageSizeOptions={pageSizeOptions}
        name={name}
      />
    </div>
  )
}
