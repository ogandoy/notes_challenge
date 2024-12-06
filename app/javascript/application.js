import "@hotwired/turbo-rails"
import "controllers"
import '@fortawesome/fontawesome-free';

document.addEventListener("turbo:load", () => {
  const deleteButtons = document.querySelectorAll("[id^='delete-button-']");

  deleteButtons.forEach(button => {
    button.addEventListener('click', function(event) {
      const confirmed = confirm("Are you sure you want to delete this note?");
      if (!confirmed) {
        event.preventDefault();
      }
    });
  });

  setTimeout(() => {
    const flashMessages = document.querySelectorAll('.flash-message');
    flashMessages.forEach(msg => {
      msg.classList.add('opacity-0');
      setTimeout(() => {
        msg.remove();
      }, 500);
    });
  }, 5000);

});
