import InputError from '@/Components/InputError'
import { Button } from '@/Components/ui/button'
import { Input } from '@/Components/ui/input'
import { Label } from '@/Components/ui/label'
import GuestLayout from '@/Layouts/GuestLayout'
import { Head, useForm } from '@inertiajs/react'
import { FormEventHandler, useEffect } from 'react'

export default function ResetPassword({
  token,
  email
}: {
  token: string
  email: string
}) {
  const { data, setData, post, processing, errors, reset } = useForm({
    token: token,
    email: email,
    password: '',
    password_confirmation: ''
  })

  useEffect(() => {
    return () => {
      reset('password', 'password_confirmation')
    }
  }, [])

  const submit: FormEventHandler = (e) => {
    e.preventDefault()

    post(route('password.store'))
  }

  return (
    <GuestLayout>
      <Head title="Reset Password" />

      <form onSubmit={submit}>
        <div>
          <Label htmlFor="email">Email</Label>

          <Input
            id="email"
            type="email"
            name="email"
            value={data.email}
            className="block w-full mt-1"
            autoComplete="username"
            onChange={(e) => setData('email', e.target.value)}
          />

          <InputError message={errors.email} className="mt-2" />
        </div>

        <div className="mt-4">
          <Label htmlFor="password">Password</Label>

          <Input
            id="password"
            type="password"
            name="password"
            value={data.password}
            className="block w-full mt-1"
            autoComplete="new-password"
            onChange={(e) => setData('password', e.target.value)}
          />

          <InputError message={errors.password} className="mt-2" />
        </div>

        <div className="mt-4">
          <Label htmlFor="password_confirmation">
            Confirm Password
          </Label>

          <Input
            type="password"
            name="password_confirmation"
            value={data.password_confirmation}
            className="block w-full mt-1"
            autoComplete="new-password"
            onChange={(e) =>
              setData('password_confirmation', e.target.value)
            }
          />

          <InputError
            message={errors.password_confirmation}
            className="mt-2"
          />
        </div>

        <div className="flex items-center justify-end mt-4">
          <Button className="ms-4" disabled={processing}>
            Reset Password
          </Button>
        </div>
      </form>
    </GuestLayout>
  )
}
