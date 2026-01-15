using Microsoft.Sales.Customer;

pageextension 90103 CustomerPageExtList extends "Customer Card"
{
    layout
    {
        addlast(content)
        {
            repeater(Group)
            {
                field(DeliveryTimePreference; Rec.DeliveryTimePreference)
                {
                    ApplicationArea = All;
                    Editable = True;

                }
                field(DeliveryInstructions; Rec.DeliveryInstructions)
                {
                    ApplicationArea = All;
                    Editable = True;

                }
                field(DeliveryContactName; Rec.DeliveryContactName)
                {

                    ApplicationArea = All;
                    Editable = True;

                }
                field(DeliveryContactPhone; Rec.DeliveryContactPhone)
                {
                    ApplicationArea = All;
                    Editable = True;
                }
            }
        }
    }
}