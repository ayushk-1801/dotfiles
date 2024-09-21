TODO_FILE="$HOME/Ayush/todos.md"

TODO_COUNT=$(grep -c '^- \[ \]' "$TODO_FILE")

echo "$TODO_COUNT"
