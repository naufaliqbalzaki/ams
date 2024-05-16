import { Cross2Icon } from '@radix-ui/react-icons'
import { Table } from '@tanstack/react-table'

import { Button } from '@/Components/ui/button'
import { Input } from '@/Components/ui/input'
import { DataTableViewOptions } from './DataTableViewOptions'

interface DataTableToolbarProps<TData> {
  table: Table<TData>
  name?: 'documents' | 'instances' | 'reports'
  doc_type?: 'central' | 'east'
  searchParam?: string
}

export function DataTableToolbar<TData>({
  table,
  name,
  doc_type,
  searchParam
}: DataTableToolbarProps<TData>) {
  const isFiltered = table.getState().columnFilters.length > 0

  return (
    <div className="flex items-center justify-between">
      <div className="flex items-center flex-1 space-x-2">
        <Input
          placeholder={`Cari ${searchParam === 'from' ? 'pemohon' : 'nama'}`}
          value={
            (table
              .getColumn(searchParam || '')
              ?.getFilterValue() as string) ?? ''
          }
          onChange={(event) =>
            table
              .getColumn(searchParam || '')
              ?.setFilterValue(event.target.value)
          }
          className="h-8 w-[150px] lg:w-[250px]"
        />
        {isFiltered && (
          <Button
            variant="ghost"
            onClick={() => table.resetColumnFilters()}
            className="h-8 px-2 lg:px-3"
          >
            Reset
            <Cross2Icon className="w-4 h-4 ml-2" />
          </Button>
        )}
      </div>
      <DataTableViewOptions
        table={table}
        name={name}
        doc_type={doc_type}
      />
    </div>
  )
}
