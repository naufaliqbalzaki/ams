import{W as u,j as e,A as r,y as i}from"./app--bgrqt_F.js";import{I as o}from"./InputError-DiH5so8I.js";import{A as j,a as f,b as D,c as y,d as A,e as N,f as I,g as b}from"./alert-dialog-B4WTZWnA.js";import{B as n}from"./button-dMpf8Pr_.js";import{I as m}from"./input-BA5B8DjG.js";import{L as v}from"./label-DSBTQqsN.js";import{U as k}from"./index-D3RA4NCA.js";import"./index-CVAeVBQm.js";import"./index-B1FUkO9o.js";const w=({doc_type:a,importOpen:d,setImportOpen:x})=>{const{data:c,setData:p,post:h,processing:t,errors:l}=u({xlsx:null,doc_type:a,type:""});function g(s){s.preventDefault(),c.xlsx===null&&r.error("Tolong pilih file xlsx yang akan diimport."),r.loading("Mengimport dokumen..."),h(route("documents.import"),{forceFormData:!0,onSuccess:()=>{i.reload()},onFinish:()=>{i.reload()}})}return e.jsxs(j,{open:d,onOpenChange:s=>x(s),children:[e.jsx(f,{asChild:!0,children:e.jsxs(n,{variant:"secondary",children:[e.jsx(k,{className:"w-5 h-5"}),"Import"]})}),e.jsxs(D,{children:[e.jsxs(y,{children:[e.jsx(A,{children:"Import Documents (xlsx)"}),e.jsxs(N,{children:["Import dokumen menggunakan template yang telah disediakan."," ",e.jsx("a",{href:"#",className:"text-blue-500",children:"Unduh template"})]})]}),e.jsxs("form",{onSubmit:g,children:[e.jsxs("div",{className:"mt-4",children:[e.jsxs("div",{className:"mt-4",children:[e.jsx(v,{className:"mb-1",htmlFor:"xlsx",children:"Pilih file xlsx"}),e.jsx(m,{id:"xlsx",name:"xlsx",type:"file",className:"file:text-foreground",accept:".xlsx",onChange:s=>{s.target.files&&p("xlsx",s.target.files[0])}}),e.jsx(o,{message:l.xlsx,className:"mt-2"})]}),e.jsxs("div",{className:"mt-4",children:[e.jsx(m,{id:"doc_type",name:"doc_type",type:"hidden",value:a,className:"hidden"}),e.jsx(o,{message:l.doc_type,className:"mt-2"})]})]}),e.jsxs(I,{className:"mt-4",children:[e.jsx(b,{disabled:t,children:"Batal"}),e.jsx(n,{type:"submit",disabled:t,children:"Import"})]})]})]})]})};export{w as ImportForm};
