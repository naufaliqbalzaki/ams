import{r as t,j as k}from"./app-CgyQeRWE.js";import{$ as N,_ as C,c as y}from"./button-B8vYVqyT.js";import{$ as S,b as D,c as g,d as M,j as q}from"./index-B1jJIOIw.js";import{$ as B}from"./index-CpsOBOZ-.js";import{$ as O}from"./index-Bmk89TnL.js";import{$ as w}from"./index-C182Cx1n.js";const _="Checkbox",[A,Z]=S(_),[K,L]=A(_),H=t.forwardRef((e,n)=>{const{__scopeCheckbox:o,name:d,checked:b,defaultChecked:a,required:u,disabled:i,value:f="on",onCheckedChange:p,...v}=e,[c,m]=t.useState(null),j=N(n,r=>m(r)),h=t.useRef(!1),E=c?!!c.closest("form"):!0,[l=!1,x]=D({prop:b,defaultProp:a,onChange:p}),I=t.useRef(l);return t.useEffect(()=>{const r=c==null?void 0:c.form;if(r){const $=()=>x(I.current);return r.addEventListener("reset",$),()=>r.removeEventListener("reset",$)}},[c,x]),t.createElement(K,{scope:o,state:l,disabled:i},t.createElement(w.button,C({type:"button",role:"checkbox","aria-checked":s(l)?"mixed":l,"aria-required":u,"data-state":P(l),"data-disabled":i?"":void 0,disabled:i,value:f},v,{ref:j,onKeyDown:g(e.onKeyDown,r=>{r.key==="Enter"&&r.preventDefault()}),onClick:g(e.onClick,r=>{x($=>s($)?!0:!$),E&&(h.current=r.isPropagationStopped(),h.current||r.stopPropagation())})})),E&&t.createElement(z,{control:c,bubbles:!h.current,name:d,value:f,checked:l,required:u,disabled:i,style:{transform:"translateX(-100%)"}}))}),T="CheckboxIndicator",X=t.forwardRef((e,n)=>{const{__scopeCheckbox:o,forceMount:d,...b}=e,a=L(T,o);return t.createElement(M,{present:d||s(a.state)||a.state===!0},t.createElement(w.span,C({"data-state":P(a.state),"data-disabled":a.disabled?"":void 0},b,{ref:n,style:{pointerEvents:"none",...e.style}})))}),z=e=>{const{control:n,checked:o,bubbles:d=!0,...b}=e,a=t.useRef(null),u=B(o),i=O(n);return t.useEffect(()=>{const f=a.current,p=window.HTMLInputElement.prototype,c=Object.getOwnPropertyDescriptor(p,"checked").set;if(u!==o&&c){const m=new Event("click",{bubbles:d});f.indeterminate=s(o),c.call(f,s(o)?!1:o),f.dispatchEvent(m)}},[u,o,d]),t.createElement("input",C({type:"checkbox","aria-hidden":!0,defaultChecked:s(o)?!1:o},b,{tabIndex:-1,ref:a,style:{...e.style,...i,position:"absolute",pointerEvents:"none",opacity:0,margin:0}}))};function s(e){return e==="indeterminate"}function P(e){return s(e)?"indeterminate":e?"checked":"unchecked"}const R=H,F=X,G=t.forwardRef(({className:e,...n},o)=>k.jsx(R,{ref:o,className:y("peer h-4 w-4 shrink-0 rounded-sm border border-primary shadow focus-visible:outline-none focus-visible:ring-1 focus-visible:ring-ring disabled:cursor-not-allowed disabled:opacity-50 data-[state=checked]:bg-primary data-[state=checked]:text-primary-foreground",e),...n,children:k.jsx(F,{className:y("flex items-center justify-center text-current"),children:k.jsx(q,{className:"h-4 w-4"})})}));G.displayName=R.displayName;export{G as C};
