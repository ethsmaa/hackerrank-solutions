select n,
case 
when p is null then "Root"
when n in (select P from BST) THEN "Inner"
Else "Leaf" end
from bst
ORDER BY n;
