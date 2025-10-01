
const initializeCounter = () => {
  const countBtn = document.getElementById('count-articles');
  const showResults = document.getElementById('article-count');

  if (!countBtn || !showResults) return;

  const countClick = () => {
    if (!showResults) return;
    const articles = document.querySelectorAll('.article-card');
    const count = articles.length;
    if (count === 0) {
      showResults.textContent = `Aucun articles trouves`;
      showResults.classList.remove('bg-secondary');
      showResults.classList.add('bg-warning');
    } else {
      showResults.textContent = `${count} ${count > 1 ? 'articles trouves' : 'article trouve'}`;
      showResults.classList.remove('bg-secondary');
      showResults.classList.add('bg-success');
    }
  };

  countBtn.removeEventListener('click', countClick);

  if (countBtn && showResults) {
    countBtn.addEventListener('click', countClick);
  }
};

document.addEventListener('turbo:load', initializeCounter);
document.addEventListener('DOMContentLoaded', initializeCounter);




