import{q as v,r as c,A as d,W as N,j as s}from"./app-BTbKT5nC.js";import{I as i}from"./InputError-DbudQ56o.js";import{B as S}from"./button-DpukZX7s.js";import{I as p}from"./input-BGy5h4zV.js";import{L as l}from"./label-CDhgRYO6.js";import"./index-COKPUyCZ.js";import"./index-CwSkdbo3.js";function F({className:h=""}){const r=v().props.flash;c.useEffect(()=>{d.dismiss(),r!=null&&r.success&&d.success(r.success),r!=null&&r.error&&d.error(r.error)},[r]);const m=c.useRef(null),u=c.useRef(null),{data:e,setData:t,errors:o,put:j,reset:n,processing:g,recentlySuccessful:b}=N({current_password:"",password:"",password_confirmation:""}),_=a=>{a.preventDefault(),j(route("password.update"),{preserveScroll:!0,onSuccess:()=>n(),onError:w=>{var f,x;w.password&&(n("password","password_confirmation"),(f=m.current)==null||f.focus()),w.current_password&&(n("current_password"),(x=u.current)==null||x.focus())}})};return s.jsxs("section",{className:h,children:[s.jsxs("header",{children:[s.jsx("h2",{className:"text-lg font-medium text-gray-900 dark:text-gray-100",children:"Ubah Kata Sandi"}),s.jsx("p",{className:"mt-1 text-sm text-gray-600 dark:text-gray-400",children:"Pastikan kata sandi Anda aman."})]}),s.jsxs("form",{onSubmit:_,className:"h-full mt-6 space-y-6",children:[s.jsxs("div",{children:[s.jsx(l,{htmlFor:"current_password",children:"Kata Sandi Saat Ini"}),s.jsx(p,{id:"current_password",ref:u,value:e.current_password,onChange:a=>t("current_password",a.target.value),type:"password",className:"block w-full mt-1",autoComplete:"current-password"}),s.jsx(i,{message:o.current_password,className:"mt-2"})]}),s.jsxs("div",{children:[s.jsx(l,{htmlFor:"password",children:"Kata Sandi Baru"}),s.jsx(p,{id:"password",ref:m,value:e.password,onChange:a=>t("password",a.target.value),type:"password",className:"block w-full mt-1",autoComplete:"new-password"}),s.jsx(i,{message:o.password,className:"mt-2"})]}),s.jsxs("div",{children:[s.jsx(l,{htmlFor:"password_confirmation",children:"Konfirmasi Kata Sandi Baru"}),s.jsx(p,{id:"password_confirmation",value:e.password_confirmation,onChange:a=>t("password_confirmation",a.target.value),type:"password",className:"block w-full mt-1",autoComplete:"new-password"}),s.jsx(i,{message:o.password_confirmation,className:"mt-2"})]}),s.jsx("div",{className:"flex items-center gap-4",children:s.jsx(S,{disabled:g,className:"absolute bottom-0 w-full",children:"Simpan"})})]})]})}export{F as default};
