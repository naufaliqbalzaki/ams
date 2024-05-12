import { Pencil1Icon, TrashIcon } from '@radix-ui/react-icons'
import { Row } from '@tanstack/react-table'

import { Button } from '@/Components/ui/button'
import { Link, router } from '@inertiajs/react'
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
} from '../ui/alert-dialog'

interface DataTableRowActionsProps<TData> {
  row: Row<TData>
  name: 'documents' | 'instances'
}

export function DataTableRowActions({
  row,
  name
}: DataTableRowActionsProps<any>) {
  return (
    <div className="flex items-center justify-center gap-2">
      <Link href={`/${name}/${row.original.id}/edit`}>
        <Button
          className="bg-blue-500 bg-opacity-5 w-min"
          variant="ghost"
          type="button"
        >
          <Pencil1Icon className="w-4 h-4 text-blue-500" />
        </Button>
      </Link>
      <AlertDialog>
        <AlertDialogTrigger asChild>
          <Button
            className="bg-red-500 bg-opacity-5 w-min"
            variant="ghost"
          >
            <TrashIcon className="w-4 h-4 text-red-500" />
          </Button>
        </AlertDialogTrigger>
        <AlertDialogContent>
          <AlertDialogHeader>
            <AlertDialogTitle>
              Are you sure you want to delete this instance?
            </AlertDialogTitle>
            <AlertDialogDescription>
              Once your this instance with name{' '}
              <strong>{row.original.name}</strong> is deleted, all of
              its resources and data will be permanently deleted.
            </AlertDialogDescription>
          </AlertDialogHeader>
          <AlertDialogFooter>
            <AlertDialogCancel>Cancel</AlertDialogCancel>
            <AlertDialogAction
              onClick={() =>
                router.visit(`/${name}/${row.original.id}`, {
                  method: 'delete'
                })
              }
            >
              Delete
            </AlertDialogAction>
          </AlertDialogFooter>
        </AlertDialogContent>
      </AlertDialog>
    </div>
  )
}
