import{j as e,Y as l}from"./app-BTbKT5nC.js";import{D as c,a}from"./DataTableColumnHeader-DQJ2uj6W.js";import{B as n}from"./button-DpukZX7s.js";import{A as m}from"./AuthenticatedLayout-FwMqvxd9.js";import{D as o}from"./index-BmskVJR_.js";import"./popover-C6QiAeKj.js";import"./index-B0qJIWLj.js";import"./index-CwSkdbo3.js";import"./input-BGy5h4zV.js";import"./alert-dialog-iF6nmhrp.js";function N({auth:s,subjects:r}){const i=[{accessorKey:"subject",meta:"Perizinan",header:({column:t})=>e.jsx(a,{column:t,title:"Perizinan"})},{accessorKey:"approved_total",meta:"Disetujui",header:({column:t})=>e.jsx("div",{className:"flex items-center justify-center gap-2 ml-4",children:e.jsx(a,{column:t,title:"Disetujui"})}),cell(t){return e.jsx("div",{className:"flex items-center justify-center gap-2",children:t.getValue()})}},{accessorKey:"corrective_total",meta:"Dikembalikan",header:({column:t})=>e.jsx("div",{className:"flex items-center justify-center gap-2 ml-4",children:e.jsx(a,{column:t,title:"Dikembalikan"})}),cell(t){return e.jsx("div",{className:"flex items-center justify-center gap-2",children:t.getValue()})}},{accessorKey:"total",meta:"Total",header:({column:t})=>e.jsx("div",{className:"flex items-center justify-center gap-2 ml-4",children:e.jsx(a,{column:t,title:"Total"})}),cell(t){return e.jsx("div",{className:"flex items-center justify-center gap-2",children:t.getValue()})}}];return e.jsxs(m,{user:s.user,header:e.jsxs("div",{className:"flex items-center justify-between gap-2",children:[e.jsx("h2",{className:"text-xl font-semibold leading-tight text-gray-800 dark:text-gray-200",children:"Laporan"}),e.jsx("div",{className:"flex items-center gap-2",children:e.jsx("a",{href:route("reports.download"),children:e.jsxs(n,{type:"button",children:[e.jsx(o,{className:"w-5 h-5"}),"Unduh"]})})})]}),children:[e.jsx(l,{title:"Laporan"}),e.jsx("div",{className:"px-8 pb-8 mx-auto max-w-[1728px]",children:e.jsx(c,{columns:i,data:r,name:"reports",searchParam:"subject",pageSizeOptions:[50,100,200,500]})})]})}export{N as default};