page 90108 DeliveryPreferencesFactBoxMgt
{
    PageType = CardPart;
    SourceTable = "Sales Header";
    Caption = 'Delivery Preferences';
    ApplicationArea = All;

    layout
    {
        area(Content)
        {

            field(DeliveryTimePref; Rec.DeliveryTimePreference)
            {
                ApplicationArea = All;
                Caption = 'Time Preference';
            }

            field(DeliveryInstructions; Rec.DeliveryInstructions)
            {
                ApplicationArea = All;
                Caption = 'Instructions';
                MultiLine = true;
            }


            field(DeliveryContactName; Rec.DeliveryContactName)
            {
                caption = 'Delivery Contact';
                ApplicationArea = All;
            }

            field(DeliveryContactPhone; Rec.DeliveryContactPhone)
            {
                caption = 'Delivery Phone Number';
                ApplicationArea = All;

            }
        }
    }
}

