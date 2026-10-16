document.addEventListener('DOMContentLoaded', () => {
  const toggle = document.querySelector('.menu-toggle');
  const nav = document.querySelector('.main-nav');
  if (toggle && nav) {
    toggle.addEventListener('click', () => {
      const open = nav.classList.toggle('nav-open');
      toggle.setAttribute('aria-expanded', String(open));
      toggle.textContent = open ? '×' : '☰';
    });
  }
  document.querySelectorAll('.check-action').forEach(button => {
    button.addEventListener('click', () => {
      const panel = document.getElementById('commitment');
      const text = document.getElementById('commitment-text');
      if (!panel || !text) return;
      text.textContent = `Kamu memilih “${button.dataset.actionTitle}”. Tentukan waktu untuk memulainya dan ajak orang di sekitarmu jika memungkinkan.`;
      panel.hidden = false;
      panel.scrollIntoView({ behavior: 'smooth', block: 'center' });
    });
  });
  const close = document.getElementById('close-commitment');
  if (close) close.addEventListener('click', () => { document.getElementById('commitment').hidden = true; });
});