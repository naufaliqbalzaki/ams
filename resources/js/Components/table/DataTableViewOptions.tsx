import { DropdownMenuTrigger } from '@radix-ui/react-dropdown-menu'
import { MixerHorizontalIcon } from '@radix-ui/react-icons'
import { Table } from '@tanstack/react-table'

import {
  AlertDialog,
  AlertDialogAction,
  AlertDialogCancel,
  AlertDialogContent,
  AlertDialogDescription,
  AlertDialogFooter,
  AlertDialogHeader,
  AlertDialogTitle,
  AlertDialogTrigger
} from '@/Components/ui/alert-dialog'
import { Button, buttonVariants } from '@/Components/ui/button'
import {
  DropdownMenu,
  DropdownMenuCheckboxItem,
  DropdownMenuContent,
  DropdownMenuLabel,
  DropdownMenuSeparator
} from '@/Components/ui/dropdown-menu'
import { router } from '@inertiajs/react'

interface DataTableViewOptionsProps<TData> {
  table: Table<TData>
  name?: 'documents' | 'instances' | 'reports'
  doc_type?: 'central' | 'east'
}

export function DataTableViewOptions<TData>({
  table,
  name,
  doc_type
}: DataTableViewOptionsProps<TData>) {
  const selectedRows = table.getFilteredSelectedRowModel().rows

  const handleDeleteSelectedRows = () => {
    const ids = selectedRows.map((row: any) => {
      return parseInt(row.original.id)
    })
    router.post(route(`${name}.destroy_batch`), {
      doc_type: doc_type,
      ids: ids
    })
  }

  return (
    <>
      {selectedRows.length > 0 && (
        <AlertDialog>
          <AlertDialogTrigger asChild>
            <Button
              variant="destructive"
              size="sm"
              className="hidden h-8 mr-2 lg:flex"
            >
              Hapus {selectedRows.length} baris terpilih
            </Button>
          </AlertDialogTrigger>
          <AlertDialogContent>
            <AlertDialogHeader>
              <AlertDialogTitle>
                Hapus {selectedRows.length} baris terpilih
              </AlertDialogTitle>
              <AlertDialogDescription>
                Apakah Anda yakin ingin menghapus{' '}
                {selectedRows.length} baris terpilih?
              </AlertDialogDescription>
            </AlertDialogHeader>
            <AlertDialogFooter>
              <AlertDialogCancel>Batal</AlertDialogCancel>
              <AlertDialogAction
                className={buttonVariants({
                  variant: 'destructive'
                })}
                onClick={handleDeleteSelectedRows}
              >
                Hapus
              </AlertDialogAction>
            </AlertDialogFooter>
          </AlertDialogContent>
        </AlertDialog>
      )}

      <DropdownMenu>
        <DropdownMenuTrigger asChild>
          <Button
            variant="outline"
            size="sm"
            className="hidden h-8 ml-auto lg:flex"
          >
            <MixerHorizontalIcon className="w-4 h-4 mr-2" />
            Filter
          </Button>
        </DropdownMenuTrigger>
        <DropdownMenuContent align="end" className="w-[150px]">
          <DropdownMenuLabel>
            Kolom yang ditampilkan
          </DropdownMenuLabel>
          <DropdownMenuSeparator />
          {table
            .getAllColumns()
            .filter(
              (column) =>
                typeof column.accessorFn !== 'undefined' &&
                column.getCanHide()
            )
            .map((column) => {
              return (
                <DropdownMenuCheckboxItem
                  key={column.id}
                  className="capitalize"
                  checked={column.getIsVisible()}
                  onCheckedChange={(value) =>
                    column.toggleVisibility(!!value)
                  }
                >
                  {column.id}
                </DropdownMenuCheckboxItem>
              )
            })}
        </DropdownMenuContent>
      </DropdownMenu>
    </>
  )
}
