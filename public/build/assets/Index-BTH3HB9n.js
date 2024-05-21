import{r as m,A as n,j as a,y as d,Y as g,a as x}from"./app-CgyQeRWE.js";import{D as h}from"./DataTable-CNR9Gm1k.js";import{D as p}from"./DataTableRowActions-Dae7ymZq.js";import{B as c}from"./button-B8vYVqyT.js";import{C as l}from"./checkbox-CmgL1Fjx.js";import{A as u}from"./AuthenticatedLayout-BiILBmYR.js";import{P as j,e as o,f as N,g as b}from"./index-B1jJIOIw.js";import"./popover-aKBOASnK.js";import"./index-D7EVMudf.js";import"./index-C182Cx1n.js";import"./index-Bmk89TnL.js";import"./Combination-CxV1gsB8.js";import"./index-CpsOBOZ-.js";import"./input-BLhrMaN-.js";import"./alert-dialog-BZceTB_7.js";import"./separator-CRq3983a.js";function S({appUrl:r}){return[{id:"select",header:({table:e})=>a.jsx(l,{checked:e.getIsAllPageRowsSelected()||e.getIsSomePageRowsSelected()&&"indeterminate",onCheckedChange:t=>e.toggleAllPageRowsSelected(!!t),"aria-label":"Select all",className:"translate-y-[2px]"}),cell:({row:e})=>a.jsx(l,{checked:e.getIsSelected(),onCheckedChange:t=>e.toggleSelected(!!t),"aria-label":"Select row",className:"translate-y-[2px]"}),enableSorting:!1,enableHiding:!1},{accessorKey:"image",header:"Gambar",cell:({row:e})=>{var s;console.log(e.original.image);const i=((s=e.original.image)==null?void 0:s.toString().startsWith("https://via.placeholder"))?"https://placehold.jp/150x150.png":r+"/storage/instances/"+e.original.image;return a.jsx("div",{className:"object-cover bg-contain",children:a.jsx("img",{src:i,alt:e.original.name,className:"object-cover object-center transition-all duration-300 h-28 rounded-xl w-28"})})}},{accessorKey:"name",header({column:e}){return a.jsxs(c,{variant:"ghost",onClick:()=>e.toggleSorting(e.getIsSorted()==="asc"),children:["Nama",a.jsx(o,{className:"w-4 h-4 ml-2"})]})},cell:({row:e})=>a.jsx(x,{href:e.original.website,className:"text-blue-500 hover:underline",children:e.original.name})},{accessorKey:"email",header({column:e}){return a.jsxs(c,{variant:"ghost",onClick:()=>e.toggleSorting(e.getIsSorted()==="asc"),children:["Email",a.jsx(o,{className:"w-4 h-4 ml-2"})]})}},{accessorKey:"is_active",header(e){return a.jsx("div",{className:"text-center",children:"Aktif"})},cell:({row:e})=>a.jsx("div",{className:"flex items-center justify-center",children:e.original.is_active?a.jsx(N,{className:"w-5 h-5 text-green-500"}):a.jsx(b,{className:"w-5 h-5 text-red-500"})})},{accessorKey:"created_at",header:"Dibuat pada",cell:({row:e})=>a.jsx("time",{dateTime:e.original.created_at,children:new Date(e.original.created_at).toLocaleDateString("id-ID",{day:"numeric",month:"long",year:"numeric"})})},{id:"actions",header(){return a.jsx("div",{className:"text-center",children:"Aksi"})},cell:({row:e})=>a.jsx(p,{row:e,name:"instances"})}]}function G({auth:r,instances:e,flash:t,appUrl:i}){const s=S({appUrl:i});return m.useEffect(()=>{t!=null&&t.success&&n.success(t.success),t!=null&&t.error&&n.error(t.error)},[t]),a.jsxs(u,{user:r.user,header:a.jsxs("div",{className:"flex items-center justify-between gap-2",children:[a.jsxs("h2",{className:"text-xl font-semibold leading-tight text-gray-800 dark:text-gray-200",children:["Dinas ( ",e.length," )"]}),a.jsxs(c,{className:"flex items-center gap-2",onClick:()=>d.visit("/instances/create"),children:[a.jsx(j,{className:"w-5 h-5"}),"Buat Baru"]})]}),children:[a.jsx(g,{title:"Dinas"}),a.jsx("div",{className:"px-8 pb-8 mx-auto max-w-7xl",children:a.jsx(h,{columns:s,data:e,name:"instances",searchParam:"name"})})]})}export{G as default};
