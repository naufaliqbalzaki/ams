import Authenticated from '@/Layouts/AuthenticatedLayout'
import { Document, Instance, PageProps } from '@/types'
import { Head } from '@inertiajs/react'
import { useEffect, useState } from 'react'
import { DocumentForm } from './_form'

export default function EditDocumentPage({
  auth,
  document,
  instances
}: PageProps & {
  document: Document
  instances: Instance[]
}) {
  const [docType, setType] = useState('central')

  useEffect(() => {
    const nowUrl = new URL(window.location.href)
    const docTypeParam = nowUrl.searchParams.get('type')
    if (docTypeParam) {
      setType(docTypeParam)
    }
  }, [docType])
  console.log(document)
  return (
    <Authenticated
      user={auth.user}
      header={
        <div className="flex items-center justify-between gap-2">
          <h2 className="text-xl font-semibold leading-tight text-gray-800 dark:text-gray-200">
            New Instances
          </h2>
        </div>
      }
    >
      <Head title="New Instances" />

      <div className="px-8 mx-auto max-w-7xl">
        <DocumentForm
          userId={auth.user.id}
          docType={docType}
          document={document}
          instances={instances}
        />
      </div>
    </Authenticated>
  )
}
