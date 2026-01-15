page 90108 DeliveryPreferencesFactBoxMgt
{
    PageType = CardPart;
    SourceTable = "Sales Header";
    Caption = 'Delivery Preferences';
    Editable = True;
    layout
    {
        area(Content)
        {
            group(DeliveryInfo)
            {
                Caption = 'Delivery Instructions';
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

                group(ContactInfo)
                {
                    Caption = 'Contact';

                    field(DeliveryContactName; Rec.DeliveryContactName)
                    {
                        caption = 'Delivery Contact';
                        ApplicationArea = All;
                        ShowCaption = false;
                    }

                    field(DeliveryContactPhone; Rec.DeliveryContactPhone)
                    {
                        ApplicationArea = All;
                        ShowCaption = false;
                    }
                }
            }
        }
    }
}