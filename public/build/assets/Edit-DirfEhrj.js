import{r as i,j as t,Y as p}from"./app-CKGnkuWl.js";import{A as n}from"./AuthenticatedLayout-DLcwZIFu.js";import{DocumentForm as c}from"./_form-DScP_vVn.js";import"./button-rv4JaW_D.js";import"./index-CJ9LMwL3.js";import"./index-N1Jofh9g.js";import"./index-Diz8zdd3.js";import"./index-hpoL8vc9.js";import"./Combination-Bo5_z7jD.js";import"./InputError-CUjhcnXB.js";import"./popover-BD4e04CA.js";import"./index-BSxHL-J5.js";import"./input-K1h-9iAn.js";import"./label-BBTy-Ek8.js";import"./index-Bmcg_xQo.js";function T({auth:e,document:r,instances:a}){const[o,m]=i.useState("central");return i.useEffect(()=>{const s=new URL(window.location.href).searchParams.get("type");s&&m(s)},[o]),t.jsxs(n,{user:e.user,header:t.jsx("div",{className:"flex items-center justify-between gap-2",children:t.jsxs("h2",{className:"text-xl font-semibold leading-tight text-gray-800 dark:text-gray-200",children:['Ubah Surat "',r.from,'"']})}),children:[t.jsx(p,{title:`Ubah Surat "${r.from}"`}),t.jsx("div",{className:"px-8 mx-auto max-w-7xl",children:t.jsx(c,{userId:e.user.id,docType:o,document:r,instances:a})})]})}export{T as default};