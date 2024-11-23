# Bookstore's Stock Replenishment

Your friend Maxime owns a bookstore.

Every month he does a manual full inventory of the shop, then orders books to replenish the stock.
This takes him several hours.

As you are tired of hearing him complain about how thankless this task is, you have decided to give him a helping *developer* hand.

## Your task

… is to provide a function that returns the list of books and the quantity to order.

In inputs, you'll have:
- the catalog: list of books that need to be replenished, with the desired amount limit
- the inventory notes: Maxime's notes written during the inventory

## Example

With the catalog:
- "The Great Gatsby" 10
- "White Fang" 10

And the inventory notes:
- "The Great Gatsby"
- "The Great Gatsby"
- "White Fang"
- "The Great Gatsby"

Then, the replenish list must be:
- "The Great Gatsby" 7
- "White Fang" 9

## Notes Rules

Be aware that Maxime may use different forms in his notes:
- the exact book name: "The Great Gatsby"
- one of the principal keyword: "Gatsby" (unique in the catalog)
- the complete abbreviation of the book: "tgg" (unique in the catalog)

He can also stack books in a same note, using " x<number>" suffix
- "The Great Gatsby x4"
- "tgg x10"

The case does not matter
- "The Great Gatsby"
- "the gReat Gatsby"
- "TGg"

Notes may include books that have been removed from the catalog

## Replenish List Rules

- The list only includes books from the catalog
- The list only includes books that need to be replenish

## WARNING

- keep an eye on performance, tests will be done for large bookstores
