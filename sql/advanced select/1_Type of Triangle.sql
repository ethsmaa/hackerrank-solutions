select 
    case 
        when a + b > c and a+c > b and b + c > a then
            case
                when a = b and b = c then 'Equilateral'
                when a = b or b = c or a = c then 'Isosceles'
                else 'Scalene'
            end
        else 'Not A Triangle'
    end
from triangles;
