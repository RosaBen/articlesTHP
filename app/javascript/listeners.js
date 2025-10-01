// Attendre que le DOM soit chargé avant d'exécuter le code
document.addEventListener('turbo:load', function () {

  // Gestion de l'article privé
  const articleIsPrivate = document.getElementById('article_is_private');

  const handlePrivateArticle = () => {
    if (articleIsPrivate.checked) {
      warning('Vous avez choisi de rendre cet article privé.');
      articleIsPrivate.value = '1';
    } else {
      articleIsPrivate.value = '0';
    }
  };

  if (articleIsPrivate) {
    articleIsPrivate.addEventListener('change', handlePrivateArticle);
  }

  // Fermeture automatique après 5 secondes
  const hasFlashMessage = document.querySelector('.custom-alert');
  const hasPasswordField = document.querySelector('input[type="password"]:not([style*="display: none"])');

  if (hasFlashMessage && !hasPasswordField) {
    setTimeout(() => {
      window.location.reload();
    }, 5000);
  }



});