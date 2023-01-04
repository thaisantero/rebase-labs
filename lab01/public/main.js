const fragment = new DocumentFragment();
const url = 'http://localhost:3000/tests'

fetch(url).
  then((response) => response.json()).
  then((data) => {
    data.forEach(function(exams) {
      const li = document.createElement('li');
      li.textContent = `
        ${exams.cpf} - 
        ${exams.nome_paciente} -
        ${exams.nome_médico} -
        ${exams.tipo_exame} -
        ${exams.limites_tipo_exame} -
        ${exams.resultado_tipo_exame}
      `;
      fragment.appendChild(li);
    })
  }).
  then(() => {
    document.querySelector('ul').appendChild(fragment);
  }).
  catch(function(error) {
    console.log(error);
  });

// fetch(url)
//   .then(function(response){
//     return response.json();
//   })
//   .then(function(data){
//     let html = '';
//     data.forEach(function(exam){
//       html += `
//         <li>${exams.nome_paciente}</li>`;
//     });
//     document.getElementById('cpf').innerHTML = html;
//   })