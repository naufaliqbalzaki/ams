import '../css/app.css'
import './bootstrap'

import { createInertiaApp } from '@inertiajs/react'
import { resolvePageComponent } from 'laravel-vite-plugin/inertia-helpers'
import { hydrateRoot } from 'react-dom/client'
import { ThemeProvider } from './Components/ThemeProvider'
import { Toaster } from './Components/ui/sonner'

const appName = import.meta.env.VITE_APP_NAME || 'Laravel'

createInertiaApp({
  title: (title) => `${title} - ${appName}`,
  resolve: (name) =>
    resolvePageComponent(
      `./Pages/${name}.tsx`,
      import.meta.glob('./Pages/**/*.tsx')
    ),
  setup({ el, App, props }) {
    hydrateRoot(
      el,
      <ThemeProvider>
        <App {...props} />
        <Toaster richColors />
      </ThemeProvider>
    )

    // root.render(
    //   <ThemeProvider>
    //     <App {...props} />
    //     <Toaster richColors />
    //   </ThemeProvider>
    // )
  },
  progress: {
    color: '#4B5563'
  }
})
