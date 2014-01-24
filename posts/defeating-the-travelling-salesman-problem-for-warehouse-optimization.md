It is generally known that the [travelling salesman
problem](http://en.wikipedia.org/wiki/Travelling_salesman_problem) is NP-hard
in its unrestricted form, and thus can not be solved efficiently for large
scale problems.  But it is also known that there are many special cases where
the problem can be solved with polynomial complexity. Just because a problem
is a travelling salesman problem doesn't mean all hope is lost. Over the last
few months, my team implemented a linear complexity solution to a special case
of the travelling salesman and extended it to solve a problem highly relevant
to warehouse logistics.

When an order is placed at the Zalando shop, the items don't just appear by
magic at the doors of screaming customers like in the Zalando commercials, but
the work is done in multiple steps in Zalando's warehouses.  One of the steps
is the so called “pick” step.  In this step, a worker retrieves a bunch of
items from a large hall filled with shelves of clothes, shoes and accessories.
The hall is not unlike a large supermarket where shelves are arranged and
separated by aisles and cross aisles.  The worker retrieves the items by
picking up an empty cart and going from location to location as instructed by
his bar code scanner, not unlike a shopper picking up all the items on his
shopping list.  Once he has retrieved all the articles in his tour, he returns
the full cart and gets an empty one.  A figure of the situation can be seen
below, where the x’s denote locations where the worker must retrieve an item,
and the node at the very bottom is where he picks up and drops off his cart.

[![warehouse layout with item locations](/files/2015/01/warehouse_small.jpg)](
/files/2015/01/warehouse_small.jpg)Clearly the distance the worker has to walk
for a tour depends heavily on the order in which he retrieves all his items.
An experienced customer in our supermarket example doesn't work through his
shopping list in the order he has written the list, but he works through the
list dependent on where the items are in the supermarket in order to minimize
his travel time.  The goal of our project was thus to order the worker's list
of locations such that he takes the route with the minimal travel time.

This is exactly the issue addressed by the travelling salesman problem, and
luckily our warehouse configuration is a special case that can be solved in
polynomial time.  Therefore we were able to implement an already existing
algorithm in order to minimize the worker's travel distance.  The details of
the exact algorithm are discussed in [this
paper](http://www.sciencedirect.com/science/article/pii/S0377221700001776)1
(or the free version
[here](http://www.roodbergen.com/publications/EJOR2001.php)).  Please be
warned that, in order to understand the first paper, it is very helpful to
read [this paper](http://www.jstor.org/stable/170620)2 detailing the even
simpler case of a warehouse without a cross aisle.

By implementing this algorithm, the optimal travel time problem is not yet
fully solved since in our case minimizing travel distance doesn't always
minimize travel time.  Consider yet again our intrepid shopper in the
supermarket.  If he is particularly hungry, then he will pick up a shopping
cart before he collects all the items he wishes to purchase.  And since the
shopping cart is slow and unwieldy, he will often times leave it in the cross
aisles, pick up a few items and return to his cart.  By not having to take the
cart with him everywhere, he reduces his travel time while increasing his
travel distance.

Thus, the last step of our project was to develop an algorithm that gives the
worker hints about where to move and leave the cart, so that his overall
travel time is optimized.  In order to create an algorithm that does this, we
built on the paper from above by adding more rules to ensure that the routes
created with the cart were valid and more logic to calculate the travel speed
of the picker with and without the cart. After doing all this, we had an
algorithm that could calculate the optimal route that a warehouse worker had
to take, and where he should leave and pick up his cart.  The optimal route
for the warehouse above can be seen below, with the dark lines representing
the path that the cart takes, and the light lines the path that the worker
takes.

[![worker and cart path image](/files/2014/01/ocapi_route_small.jpg)](/files/2
014/01/ocapi_route_small.jpg)It is nice to know that, even though we didn't
solve the general travelling salesman problem in polynomial time, we did
manage to make it reveal its secrets for one special case and were able to
apply that knowledge to an issue of great relevance: our order fulfilment
efficiency, a must-have for success in online retail.

___________________________________________

1 Kees Jan Roodbergen, René de Koster, Routing order pickers in a warehouse
with a middle aisle, European Journal of Operational Research, Volume 133,
Issue 1, 16 August 2001, Pages 32-43, ISSN 0377-2217

2 H. Donald Ratliff and Arnon S. Rosenthal, Order-Picking in a Rectangular
Warehouse: A Solvable Case of the Traveling Salesman Problem, Operations
Research, Vol. 31, No. 3 (May - Jun., 1983), pp. 507-521

