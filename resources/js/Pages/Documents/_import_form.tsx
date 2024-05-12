import InputError from '@/Components/InputError'
import {
  AlertDialog,
  AlertDialogCancel,
  AlertDialogContent,
  AlertDialogDescription,
  AlertDialogFooter,
  AlertDialogHeader,
  AlertDialogTitle,
  AlertDialogTrigger
} from '@/Components/ui/alert-dialog'
import { Button } from '@/Components/ui/button'
import { Input } from '@/Components/ui/input'
import { Label } from '@/Components/ui/label'
import {
  Select,
  SelectContent,
  SelectGroup,
  SelectItem,
  SelectTrigger,
  SelectValue
} from '@/Components/ui/select'
import { router, useForm } from '@inertiajs/react'
import { UploadIcon } from '@radix-ui/react-icons'
import { FormEvent } from 'react'
import { toast } from 'sonner'

export const ImportForm = ({
  doc_type,
  importOpen,
  setImportOpen
}: {
  doc_type: string

  importOpen: boolean
  setImportOpen: (open: boolean) => void
}) => {
  const { data, setData, post, processing, errors } = useForm<{
    xlsx: File | null
    doc_type: string
    type: string
  }>({
    xlsx: null,
    doc_type: doc_type,
    type: ''
  })

  function submit(e: FormEvent<HTMLFormElement>) {
    e.preventDefault()
    if (data.xlsx === null)
      toast.error('Please select a file to import')
    toast.loading('Importing documents...')
    post(route('documents.import'), {
      forceFormData: true,
      onSuccess: () => {
        router.reload()
      },
      onFinish: () => {
        router.reload()
      }
    })
  }

  return (
    <AlertDialog
      open={importOpen}
      onOpenChange={(open) => setImportOpen(open)}
    >
      <AlertDialogTrigger asChild>
        <Button variant="secondary">
          <UploadIcon className="w-5 h-5" />
          Import
        </Button>
      </AlertDialogTrigger>
      <AlertDialogContent>
        <AlertDialogHeader>
          <AlertDialogTitle>Import Documents (xlsx)</AlertDialogTitle>
          <AlertDialogDescription>
            Upload a xlsx file to import documents, make sure your
            following the correct format.{' '}
            <a href="#" className="text-blue-500">
              Download the template
            </a>
          </AlertDialogDescription>
        </AlertDialogHeader>
        <form onSubmit={submit}>
          <div className="mt-4">
            <div className="mt-4">
              <Label className="mb-1" htmlFor="xlsx">
                Select a file
              </Label>
              <Input
                id="xlsx"
                name="xlsx"
                type="file"
                className="file:text-foreground"
                accept=".xlsx"
                onChange={(e) => {
                  if (e.target.files) {
                    setData('xlsx', e.target.files[0])
                  }
                }}
              />
              <InputError message={errors.xlsx} className="mt-2" />
            </div>
            <div className="mt-2">
              <Label className="mb-1" htmlFor="type">
                Document type
              </Label>
              <Select
                onValueChange={(value) => setData('type', value)}
              >
                <SelectTrigger>
                  <SelectValue placeholder="Select a document type" />
                </SelectTrigger>
                <SelectContent>
                  <SelectGroup>
                    <SelectItem value="incoming">Incoming</SelectItem>
                    <SelectItem value="outgoing">Outgoing</SelectItem>
                  </SelectGroup>
                </SelectContent>
              </Select>

              <InputError message={errors.type} className="mt-2" />
            </div>
            <div className="mt-4">
              <Input
                id="doc_type"
                name="doc_type"
                type="hidden"
                value={doc_type}
                className="hidden"
              />

              <InputError
                message={errors.doc_type}
                className="mt-2"
              />
            </div>
          </div>
          <AlertDialogFooter className="mt-4">
            <AlertDialogCancel disabled={processing}>
              Cancel
            </AlertDialogCancel>
            <Button type="submit" disabled={processing}>
              Import
            </Button>
          </AlertDialogFooter>
        </form>
      </AlertDialogContent>
    </AlertDialog>
  )
}
