import{W as u,j as e,A as l,y as i}from"./app-CgyQeRWE.js";import{I as o}from"./InputError-B0JEf8YU.js";import{A as j,a as f,b as D,c as y,d as A,e as N,f as I,g as b}from"./alert-dialog-BZceTB_7.js";import{B as n}from"./button-B8vYVqyT.js";import{I as m}from"./input-BLhrMaN-.js";import{L as v}from"./label-DyF9zx_6.js";import{U as k}from"./index-B1jJIOIw.js";import"./Combination-CxV1gsB8.js";import"./index-C182Cx1n.js";import"./index-DGmbteZG.js";const H=({doc_type:a,importOpen:d,setImportOpen:x})=>{const{data:c,setData:p,post:h,processing:t,errors:r}=u({xlsx:null,doc_type:a,type:""});function g(s){s.preventDefault(),c.xlsx===null&&l.error("Tolong pilih file xlsx yang akan diimport."),l.loading("Mengimport dokumen..."),h(route("documents.import"),{forceFormData:!0,onSuccess:()=>{i.reload()},onFinish:()=>{i.reload()}})}return e.jsxs(j,{open:d,onOpenChange:s=>x(s),children:[e.jsx(f,{asChild:!0,children:e.jsxs(n,{variant:"secondary",children:[e.jsx(k,{className:"w-5 h-5"}),"Import"]})}),e.jsxs(D,{children:[e.jsxs(y,{children:[e.jsx(A,{children:"Import Documents (xlsx)"}),e.jsxs(N,{children:["Import dokumen menggunakan template yang telah disediakan."," ",e.jsx("a",{href:"#",className:"text-blue-500",children:"Unduh template"})]})]}),e.jsxs("form",{onSubmit:g,children:[e.jsxs("div",{className:"mt-4",children:[e.jsxs("div",{className:"mt-4",children:[e.jsx(v,{className:"mb-1",htmlFor:"xlsx",children:"Pilih file xlsx"}),e.jsx(m,{id:"xlsx",name:"xlsx",type:"file",className:"file:text-foreground",accept:".xlsx",onChange:s=>{s.target.files&&p("xlsx",s.target.files[0])}}),e.jsx(o,{message:r.xlsx,className:"mt-2"})]}),e.jsxs("div",{className:"mt-4",children:[e.jsx(m,{id:"doc_type",name:"doc_type",type:"hidden",value:a,className:"hidden"}),e.jsx(o,{message:r.doc_type,className:"mt-2"})]})]}),e.jsxs(I,{className:"mt-4",children:[e.jsx(b,{disabled:t,children:"Batal"}),e.jsx(n,{type:"submit",disabled:t,children:"Import"})]})]})]})]})};export{H as ImportForm};
