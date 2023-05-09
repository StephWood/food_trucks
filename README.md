# FoodTrucks

This application is built with Elixir and Phoenix LiveView. In order to make
contributions, it is recommended that you have the latest versions of Elixir,
Erlang, and Phoenix installed on your machine.

To start the Phoenix server:

- Run `mix setup` to install and setup dependencies
- Start Phoenix endpoint with `mix phx.server`
- Run `mix test` to run tests

To test in your browser:

- After successfully starting the Phoenix endpoint, navigate to
  [`localhost:4000`](http://localhost:4000)
- Enter the type of food you are hoping to eat in the input box and click
  `submit`
- Discover the available food trucks that serve your food and where to find
  them!
- If you want to search for something else, simply try again.

## Why Elixir and other things?

I chose to build this application using Elixir due to its functional design and
high fault tolerance. I have implemented the frontend using Phoenix LiveView for
its fast, real-time, server-rendered UI. I was curious to work with this
framework and its communciation via websockets, as it claims to be simpler when
compared to Javascript alternatives. I worked with built-in Tailwind components
on the frontend to get familiar with this framework as it comes bundled with
LiveView.

I initally thought to use Elixir Streams for processing the data, but chose to
stick with Enums as the data set we are using here is quite small and the power
of streams seemed unnecessary. I would perhaps use Streams for very large
datasets, as well as implement a database. Since I was not planning to add to or
remove records from the dataset I didn't see the need for a database in this
particular case, though normally I would likely need to store and retrieve data
in a more secure manner.

The business logic of this application lives behind the "controller" inside of
the food_trucks directory (`FoodTrucks.Trucks`), to separate concerns and hide
this functionality from the frontend. I initially fetch the truck data and
filter for only trucks with an "approved" status as that seemed most relevant to
me for presenting the user with trucks where they could find the type of food
they are looking for.

I wasn't familiar with Tailwind and have limited experience with LiveView
styling, it is very possible there is a superior method to work with this
framework. With more time I would like to conditionally render a "no {food-item}
available" component if there are no relevant results, but I was unfamiliar with
that implementation to access data from the Tailwind form inside the heex code.
In React, I would do something like this in a TruckResults component: `const
filteredTrucks = allTrucks.filter( truck => truck.FoodItems !== undefined &&
truck.FoodItems.toLowerCase().includes(foodValue) && truck.Status === 'APPROVED'
);

const desired_trucks = filteredTrucks.map(truck => (
<Truck key={truck.applicantid} truck={truck} /> ));

return ( <> {desired_trucks.length > 0 ? ( <div>

<h3>{`${foodValue}s available at: `}</h3>
<div className='truck-results'>{desired_trucks}</div> </div> ) : (
<div>{`Sorry, no ${foodValue} available.`}</div> )} </> );`

I implemented unit tests to validate the getting and filtering of data,
rendering of elements on the frontend, and end-to-end test that input from the
front successfully resulted in a filtered list of trucks being sent back from
the backend.

## Additional Info

- If you have questions, you can reach me at `wood.steph@gmail.com`.
