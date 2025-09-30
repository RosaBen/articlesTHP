console.log('Test JS module loaded via Importmap');

// Test simple
document.addEventListener('DOMContentLoaded', function () {
  console.log('DOM loaded - test module');

  const testButton = document.getElementById('count-articles');
  if (testButton) {
    console.log('Button found by test module');
    testButton.style.border = '2px solid red';
  } else {
    console.log('Button NOT found by test module');
  }
});