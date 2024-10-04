TODO_FILE="$HOME/Ayush/Vault/Todos.md"

TODO_COUNT=$(grep -c '^- ' "$TODO_FILE")

echo "$TODO_COUNT"
