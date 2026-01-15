using Microsoft.Sales.Customer;

pageextension 90102 CustomerPageExtCard extends "Customer Card"
{
    layout
    {
        addlast(factboxes)
        {
            part(DeliveryPreferencesFactBox; DeliveryPreferencesFactBox)
            {
                Caption = 'Delivery Preferences';
                ApplicationArea = All;
                Visible = true;
            }
        }
    }
}