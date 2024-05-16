import InputError from '@/Components/InputError'
import { Button } from '@/Components/ui/button'
import { Input } from '@/Components/ui/input'
import { Label } from '@/Components/ui/label'
import { PageProps } from '@/types'
import { Transition } from '@headlessui/react'
import { Link, useForm, usePage } from '@inertiajs/react'
import { FormEventHandler } from 'react'

export default function UpdateProfileInformation({
  mustVerifyEmail,
  status,
  className = ''
}: {
  mustVerifyEmail: boolean
  status?: string
  className?: string
}) {
  const user = usePage<PageProps>().props.auth.user

  const {
    data,
    setData,
    patch,
    errors,
    processing,
    recentlySuccessful
  } = useForm({
    name: user.name,
    username: user.username
  })

  const submit: FormEventHandler = (e) => {
    e.preventDefault()

    patch(route('profile.update'))
  }

  return (
    <section className={className}>
      <header>
        <h2 className="text-lg font-medium text-gray-900 dark:text-gray-100">
          Profile Information
        </h2>

        <p className="mt-1 text-sm text-gray-600 dark:text-gray-400">
          Update your account's profile information and email address.
        </p>
      </header>

      <form onSubmit={submit} className="mt-6 space-y-6">
        <div>
          <Label htmlFor="name">Name</Label>

          <Input
            id="name"
            className="block w-full mt-1"
            value={data.name}
            onChange={(e) => setData('name', e.target.value)}
            required
            autoComplete="name"
          />

          <InputError className="mt-2" message={errors.name} />
        </div>

        <div>
          <Label htmlFor="username">username</Label>

          <Input
            id="username"
            type="username"
            className="block w-full mt-1"
            value={data.username}
            onChange={(e) => setData('username', e.target.value)}
            required
            autoComplete="username"
          />

          <InputError className="mt-2" message={errors.username} />
        </div>

        {mustVerifyEmail && user.username === null && (
          <div>
            <p className="mt-2 text-sm text-gray-800 dark:text-gray-200">
              Your email address is unverified.
              <Link
                href={route('verification.send')}
                method="post"
                as="button"
                className="text-sm text-gray-600 underline rounded-md dark:text-gray-400 hover:text-gray-900 dark:hover:text-gray-100 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 dark:focus:ring-offset-gray-800"
              >
                Click here to re-send the verification email.
              </Link>
            </p>

            {status === 'verification-link-sent' && (
              <div className="mt-2 text-sm font-medium text-green-600 dark:text-green-400">
                A new verification link has been sent to your email
                address.
              </div>
            )}
          </div>
        )}

        <div className="flex items-center gap-4">
          <Button disabled={processing}>Save</Button>

          <Transition
            show={recentlySuccessful}
            enter="transition ease-in-out"
            enterFrom="opacity-0"
            leave="transition ease-in-out"
            leaveTo="opacity-0"
          >
            <p className="text-sm text-gray-600 dark:text-gray-400">
              Saved.
            </p>
          </Transition>
        </div>
      </form>
    </section>
  )
}
