// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
document.addEventListener("DOMContentLoaded", () => {
  setTimeout(() => {
    const flashMessages = document.querySelectorAll('.flash-message');
    flashMessages.forEach(msg => msg.classList.add('hidden')); // Esconde el mensaje después de 5 segundos
  }, 5000); // 5000ms = 5 segundos
});
