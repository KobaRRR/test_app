// window.onload = function () {
//     　alert("javascript test");
//     };

// const hideText = () => {
//     const ht = document.querySelector('.header-text');
//     ht.innerHTML = "";
// }

// document.querySelector('#test1').addEventListener('click', () =>
//     hideText()
//     );
document.querySelector('#ddl').addEventListener('click', () => 
    ddlEdit()
);

const ddlEdit = () => {
    const prompt = document.querySelector('#prompt');
    prompt.innerAdjacentHTML='default';
}