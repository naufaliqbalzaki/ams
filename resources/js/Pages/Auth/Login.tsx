import Checkbox from '@/Components/Checkbox'
import InputError from '@/Components/InputError'
import GuestLayout from '@/Layouts/GuestLayout'
import { FormEventHandler, useEffect } from 'react'

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
import { Head, Link, useForm } from '@inertiajs/react'
import { toast } from 'sonner'

export default function Login({
  status,
  canResetPassword
}: {
  status?: string
  canResetPassword: boolean
}) {
  const { data, setData, post, processing, errors, reset } = useForm({
    username: '',
    password: '',
    remember: false
  })

  useEffect(() => {
    return () => {
      reset('password')
    }
  }, [])

  const submit: FormEventHandler = (e) => {
    e.preventDefault()

    post(route('login'), {
      onFinish: () => {
        if (errors.username) {
          toast.error(errors.username)
        }
        if (errors.password) {
          toast.error(errors.password)
        }
      }
    })
  }

  return (
    <GuestLayout>
      <Head title="Masuk" />

      {status && (
        <div className="mb-4 text-sm font-medium text-green-600">
          {status}
        </div>
      )}

      <Card className="w-[400px] mx-auto">
        <CardHeader>
          <CardTitle className="text-2xl font-bold">Masuk</CardTitle>
          <CardDescription>
            Silahkan masuk untuk mengakses aplikasi ini.
          </CardDescription>
        </CardHeader>
        <Separator className="mb-4" />
        <CardContent>
          <form onSubmit={submit}>
            <div>
              <Label htmlFor="username">Username</Label>

              <Input
                id="username"
                type="text"
                name="username"
                value={data.username}
                className="block w-full mt-1"
                autoComplete="additional-name"
                onChange={(e) => setData('username', e.target.value)}
              />

              <InputError
                message={errors.username}
                className="mt-2"
              />
            </div>
            <div className="mt-4">
              <Label htmlFor="password">Kata sandi</Label>

              <Input
                id="password"
                type="password"
                name="password"
                value={data.password}
                className="block w-full mt-1"
                autoComplete="current-password"
                onChange={(e) => setData('password', e.target.value)}
              />

              <InputError
                message={errors.password}
                className="mt-2"
              />
            </div>
            <div className="flex items-center justify-between mt-4 ">
              <label className="flex items-center">
                <Checkbox
                  name="remember"
                  checked={data.remember}
                  onChange={(e) =>
                    setData('remember', e.target.checked)
                  }
                />
                <span className="text-sm text-gray-600 ms-2 dark:text-gray-400">
                  Ingat saya
                </span>
              </label>{' '}
              {canResetPassword && (
                <Link
                  href={route('password.request')}
                  className="text-sm text-gray-600 underline rounded-md dark:text-gray-400 hover:text-gray-900 dark:hover:text-gray-100 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 dark:focus:ring-offset-gray-800"
                >
                  Lupa kata sandi?
                </Link>
              )}
            </div>
            <div className="flex items-center justify-end mt-4">
              <p className="text-sm text-gray-600 dark:text-gray-400">
                Belum punya akun?{' '}
                <Link
                  href={route('register')}
                  className="text-sm text-blue-600 underline "
                >
                  Daftar sekarang
                </Link>
              </p>
            </div>
            <Button className="w-full mt-4" disabled={processing}>
              Masuk
            </Button>
          </form>
        </CardContent>
      </Card>
    </GuestLayout>
  )
}
