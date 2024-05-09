import Authenticated from '@/Layouts/AuthenticatedLayout'
import { PageProps } from '@/types'

export default function DocumentShowPage({ auth }: PageProps) {
  return (
    <Authenticated
      user={auth.user}
      header={
        <h2 className="text-xl font-semibold leading-tight text-gray-800 dark:text-gray-200">
          DocumentShow
        </h2>
      }
    >
      <div className="py-12">
        <div className="mx-auto max-w-7xl sm:px-6 lg:px-8">
          <div className="overflow-hidden shadow-sm sm:rounded-lg">
            <div className="p-6 text-gray-900 dark:text-gray-100">
              You're on the documentShow page!
            </div>
          </div>
        </div>
      </div>
    </Authenticated>
  )
}
