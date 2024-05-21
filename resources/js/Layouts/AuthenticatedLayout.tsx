import NavLink from '@/Components/NavLink'
import ResponsiveNavLink from '@/Components/ResponsiveNavLink'
import ThemeButton from '@/Components/ThemeButton'
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuTrigger
} from '@/Components/ui/dropdown-menu'
import { cn } from '@/lib/utils'
import { User } from '@/types'
import { Link } from '@inertiajs/react'
import { ChevronRightIcon } from '@radix-ui/react-icons'
import { PropsWithChildren, ReactNode, useState } from 'react'

export default function Authenticated({
  user,
  header,
  children
}: PropsWithChildren<{
  user: User
  header?: ReactNode
}>) {
  const [showingNavigationDropdown, setShowingNavigationDropdown] =
    useState(false)

  const [showInstacesDropdown, setShowInstancesDropdown] =
    useState(false)

  return (
    <div className="min-h-screen">
      <nav className="border-b border-gray-100 dark:border-gray-700">
        <div className={cn('px-4 mx-auto max-w-7xl sm:px-6 lg:px-8')}>
          <div className="flex justify-between h-16">
            <div className="flex">
              <div className="flex items-center shrink-0">
                <Link href="/">
                  <img
                    className="w-auto h-10 m-auto rounded-full"
                    src="/images/logo.jpeg"
                    alt="Logo"
                  />
                </Link>
              </div>

              <div className="hidden space-x-8 sm:-my-px sm:ms-10 sm:flex">
                <NavLink
                  href={route('dashboard')}
                  active={route().current('dashboard')}
                >
                  Dashboard
                </NavLink>
                <NavLink
                  href={route('instances.index')}
                  active={route().current('instances.index')}
                >
                  Dinas
                </NavLink>
                <DropdownMenu onOpenChange={setShowInstancesDropdown}>
                  <DropdownMenuTrigger
                    asChild
                    className="flex items-center"
                  >
                    <button>
                      <NavLink
                        href="#"
                        active={route().current('documents.*')}
                      >
                        Surat
                      </NavLink>
                      <ChevronRightIcon
                        className={cn(
                          'transition-all duration-300',
                          showInstacesDropdown && 'rotate-90'
                        )}
                      />
                    </button>
                  </DropdownMenuTrigger>
                  <DropdownMenuContent>
                    <DropdownMenuItem>
                      <NavLink
                        href={route('documents.index', {
                          type: 'central'
                        })}
                        active={route().current('documents.index', {
                          type: 'central'
                        })}
                        className="w-full"
                      >
                        Pusat
                      </NavLink>
                    </DropdownMenuItem>
                    <DropdownMenuItem>
                      <NavLink
                        href={route('documents.index', {
                          type: 'east'
                        })}
                        active={route().current('documents.index', {
                          type: 'east'
                        })}
                        className="w-full"
                      >
                        Timur
                      </NavLink>
                    </DropdownMenuItem>
                  </DropdownMenuContent>
                </DropdownMenu>
                <NavLink
                  href={route('reports.index')}
                  active={route().current('reports.index')}
                >
                  Laporan
                </NavLink>
                <NavLink
                  href={route('backups.index')}
                  active={route().current('backups.index')}
                >
                  Backup
                </NavLink>
              </div>
            </div>

            <div className="hidden sm:flex sm:items-center sm:ms-6">
              <div className="relative flex items-center ms-3">
                <DropdownMenu>
                  <DropdownMenuTrigger asChild>
                    <button
                      type="button"
                      className="inline-flex items-center px-3 py-2 text-sm font-medium leading-4 text-gray-500 transition duration-150 ease-in-out border border-transparent rounded-md dark:text-gray-400 hover:text-gray-700 dark:hover:text-gray-300 focus:outline-none"
                    >
                      {user.name}
                    </button>
                  </DropdownMenuTrigger>
                  <DropdownMenuContent>
                    <Link href={route('profile.edit')}>
                      <DropdownMenuItem>Profile</DropdownMenuItem>
                    </Link>
                    <Link method="post" href={route('logout')}>
                      <DropdownMenuItem>Log Out</DropdownMenuItem>
                    </Link>
                  </DropdownMenuContent>
                </DropdownMenu>
                <ThemeButton />
              </div>
            </div>

            <div className="flex items-center -me-2 sm:hidden">
              <button
                onClick={() =>
                  setShowingNavigationDropdown(
                    (previousState) => !previousState
                  )
                }
                className="inline-flex items-center justify-center p-2 text-gray-400 transition duration-150 ease-in-out rounded-md dark:text-gray-500 hover:text-gray-500 dark:hover:text-gray-400 hover: dark:hover:bg-gray-900 focus:outline-none focus: dark:focus:bg-gray-900 focus:text-gray-500 dark:focus:text-gray-400"
              >
                <svg
                  className="w-6 h-6"
                  stroke="currentColor"
                  fill="none"
                  viewBox="0 0 24 24"
                >
                  <path
                    className={
                      !showingNavigationDropdown
                        ? 'inline-flex'
                        : 'hidden'
                    }
                    strokeLinecap="round"
                    strokeLinejoin="round"
                    strokeWidth="2"
                    d="M4 6h16M4 12h16M4 18h16"
                  />
                  <path
                    className={
                      showingNavigationDropdown
                        ? 'inline-flex'
                        : 'hidden'
                    }
                    strokeLinecap="round"
                    strokeLinejoin="round"
                    strokeWidth="2"
                    d="M6 18L18 6M6 6l12 12"
                  />
                </svg>
              </button>
            </div>
          </div>
        </div>

        <div
          className={
            (showingNavigationDropdown ? 'block' : 'hidden') +
            ' sm:hidden'
          }
        >
          <div className="pt-2 pb-3 space-y-1">
            <ResponsiveNavLink
              href={route('dashboard')}
              active={route().current('dashboard')}
            >
              Dashboard
            </ResponsiveNavLink>
            <ResponsiveNavLink
              href={route('instances.index')}
              active={route().current('instances.index')}
            >
              Dinas
            </ResponsiveNavLink>
            <ResponsiveNavLink
              href={route('documents.index')}
              active={route().current('documents.index')}
            >
              Surat
            </ResponsiveNavLink>
            <ResponsiveNavLink
              href={route('reports.index')}
              active={route().current('reports.index')}
            >
              Laporan
            </ResponsiveNavLink>
            <ResponsiveNavLink
              href={route('backups.index')}
              active={route().current('backups.index')}
            >
              Backup
            </ResponsiveNavLink>
          </div>

          <div className="pt-4 pb-1 border-t border-gray-200 dark:border-gray-600">
            <div className="flex items-center justify-between px-4">
              <div>
                <div className="text-base font-medium text-gray-800 dark:text-gray-200">
                  {user.name}
                </div>
                <div className="text-sm font-medium text-gray-500">
                  {user.username}
                </div>
              </div>
              <ThemeButton className="ml-4" />
            </div>

            <div className="mt-3 space-y-1">
              <ResponsiveNavLink href={route('profile.edit')}>
                Profile
              </ResponsiveNavLink>
              <ResponsiveNavLink
                method="post"
                href={route('logout')}
                as="button"
              >
                Log Out
              </ResponsiveNavLink>
            </div>
          </div>
        </div>
      </nav>

      {header && (
        <header>
          <div className="px-4 py-6 mx-auto max-w-7xl sm:px-6 lg:px-8">
            {header}
          </div>
        </header>
      )}

      <main>{children}</main>
    </div>
  )
}
