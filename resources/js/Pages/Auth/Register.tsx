import InputError from '@/Components/InputError'
import { Button } from '@/Components/ui/button'
import {
  Card,
  CardContent,
  CardDescription,
  CardHeader,
  CardTitle
} from '@/Components/ui/card'
import { Input } from '@/Components/ui/input'
import { Label } from '@/Components/ui/label'
import { Separator } from '@/Components/ui/separator'
import GuestLayout from '@/Layouts/GuestLayout'
import { Head, Link, useForm } from '@inertiajs/react'
import { FormEventHandler, useEffect } from 'react'
import { toast } from 'sonner'

export default function Register() {
  const { data, setData, post, processing, errors, reset } = useForm({
    name: '',
    username: '',
    nip: '',
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

    post(route('register'), {
      onBefore: () => {
        toast.dismiss()
        toast.loading('Processing...')
      },
      onError: (error) => {
        console.error(error)
        toast.dismiss()
        if (error.name) {
          toast.error(error.name)
        }
        if (error.username) {
          toast.error(error.username)
        }
        if (error.nip) {
          toast.error(error.nip)
        }
        if (error.password) {
          toast.error(error.password)
        }
        if (error.password_confirmation) {
          toast.error(error.password_confirmation)
        }
      },
      onSuccess: () => {
        toast.dismiss()
        toast.success('Account registered.')
      }
    })
  }

  return (
    <GuestLayout>
      <Head title="Register" />
      <Card>
        <CardHeader>
          <CardTitle className="text-2xl font-bold">
            Register
          </CardTitle>
          <CardDescription>
            Please provide the following information to register.
          </CardDescription>
        </CardHeader>
        <Separator className="mb-4" />
        <CardContent>
          <form onSubmit={submit}>
            <div>
              <Label htmlFor="name">Name</Label>

              <Input
                id="name"
                name="name"
                value={data.name}
                className="block w-full mt-1"
                autoComplete="name"
                onChange={(e) => setData('name', e.target.value)}
                required
              />

              <InputError message={errors.name} className="mt-2" />
            </div>

            <div className="mt-4">
              <Label htmlFor="username">Username</Label>

              <Input
                id="username"
                type="text"
                name="username"
                value={data.username}
                className="block w-full mt-1"
                autoComplete="additional-name"
                onChange={(e) => setData('username', e.target.value)}
                required
              />

              <InputError
                message={errors.username}
                className="mt-2"
              />
            </div>

            <div className="mt-4">
              <Label htmlFor="nip">NIP</Label>

              <Input
                id="nip"
                type="text"
                name="nip"
                value={data.nip}
                className="block w-full mt-1"
                autoComplete="additional-name"
                onChange={(e) => setData('nip', e.target.value)}
                required
              />

              <InputError message={errors.nip} className="mt-2" />
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
                required
              />

              <InputError
                message={errors.password}
                className="mt-2"
              />
            </div>

            <div className="mt-4">
              <Label htmlFor="password_confirmation">
                Confirm Password
              </Label>

              <Input
                id="password_confirmation"
                type="password"
                name="password_confirmation"
                value={data.password_confirmation}
                className="block w-full mt-1"
                autoComplete="new-password"
                onChange={(e) =>
                  setData('password_confirmation', e.target.value)
                }
                required
              />

              <InputError
                message={errors.password_confirmation}
                className="mt-2"
              />
            </div>

            <div className="flex items-center justify-end mt-4">
              <p className="text-sm text-gray-600 dark:text-gray-400">
                Already have an account?{' '}
                <Link
                  href={route('login')}
                  className="text-sm text-blue-600 underline "
                >
                  Log in
                </Link>
              </p>
            </div>
            <Button className="w-full mt-4" disabled={processing}>
              Register
            </Button>
          </form>
        </CardContent>
      </Card>
    </GuestLayout>
  )
}
