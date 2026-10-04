document.addEventListener("DOMContentLoaded", () => {
  const budgetValue = document.querySelector("[data-budget-value]");
  const budgetBar = document.querySelector("[data-budget-bar]");
  const choices = [...document.querySelectorAll("[data-choice]")];
  const resetButton = document.querySelector("[data-reset-budget]");
  const spendButtons = [...document.querySelectorAll("[data-spend]")];

  let budget = 100;

  function renderBudget(activeChoice) {
    if (!budgetValue) return;

    budgetValue.textContent = String(budget);

    if (budgetBar) {
      budgetBar.style.width = `${Math.max(0, budget)}%`;
      if (budget <= 30) {
        budgetBar.classList.add("danger");
        budgetValue.classList.add("low");
      } else {
        budgetBar.classList.remove("danger");
        budgetValue.classList.remove("low");
      }
    }

    if (activeChoice) {
      choices.forEach((choice) => {
        choice.classList.toggle("active", choice.dataset.choice === activeChoice);
      });
    }
  }

  spendButtons.forEach((button) => {
    button.addEventListener("click", (e) => {
      e.stopPropagation();
      const spend = Number(button.dataset.spend) || 0;
      budget = Math.max(0, budget - spend);
      renderBudget(button.dataset.targetChoice);
    });
  });

  if (resetButton) {
    resetButton.addEventListener("click", (e) => {
      e.stopPropagation();
      budget = 100;
      choices.forEach((choice, idx) => {
        choice.classList.toggle("active", idx === 0);
      });
      renderBudget("");
    });
  }

  renderBudget("chase");
});
