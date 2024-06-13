# Invoice system
### Task
######
Build an invoice system that can receive payments using M-Pesa. The backend should simply display the transaction data

#### Assumptions
1. A user can only pay for an invoice addressed to them.
2. An invoice can have many associated transactions ; say daily transactions before due date.
3. A transaction can only be associated with the user.
4. Default payment number is the number used by the user on sign up
5. This is a single charge invoice with just the total amount and no products
6. That the invoice system records the transaction history and user deletion (soft delete) does not cascade the `invoices` and `transactions` table

# FEATURES & IMPLEMENTATIONS
#  1. Set up

--------------------
##  Requirements
####     Laravel 11.x
####     php ^8.2

--------------------
## Instructions

###### - Database from project folder db dumped into your local mysql
###### - Alternatively you the project has seeders which can be used to generate data locally
        php artisan db:seed
###### - Start php server using your IP address as hostname so that it can be accessible on mobile
        php artisan serve --hostname="your ip address"




### System Roles

| Role             | Permissions                                                                      |
|------------------|----------------------------------------------------------------------------------|
| user             | view own invoices, pay for own invoices & delete own account                     |
| admin            | create,edit,delete and send invoices to users, view all users & all transactions |
| super-admin      | appoint, demote admin, delete any user account & all admin roles                 |



### Tech Stack

**Backend:** Laravel 
  - **Authentication:** Sanctum
  - **Payments:** Daraja API
  - **Frontend:** Flutter 
