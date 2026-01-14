page 50105 "DeliveryPreferencesFactBox"
{
    PageType = CardPart;
    SourceTable = Customer;
    ApplicationArea = All;
    Caption = 'Delivery Preferences';

    layout
    {
        area(content)
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
