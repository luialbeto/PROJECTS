const botaoLogin = document.querySelector('#button-login');
function alerta() {
  const selecionaDados = document.querySelector('#user-email-phone').value;
  alert(selecionaDados);
}
botaoLogin.addEventListener('click', alerta);
