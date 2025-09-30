

const countBtn = document.getElementById('count-articles');
const showResults = document.getElementById('article-count');

const countClick = () => {
  const articles = document.querySelectorAll('.article-card');
  const count = articles.length;
  if (count === 0) {
    showResults.textContent = `Aucun articles trouves`;
    showResults.classList.remove('bg-secondary');
    showResults.classList.add('bg-warning');
  } else {
    showResults.textContent = `${count} ${count > 1 ? 'articles trouves' : 'article trouve'}`;
    console.log('🚀 Counter.js loaded successfully!', articles);
    showResults.classList.remove('bg-secondary');
    showResults.classList.add('bg-success');
  }

};

countBtn.addEventListener('click', countClick);
