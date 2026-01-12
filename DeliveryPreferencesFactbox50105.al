page 50105 "Delivery Preferences FactBox"
{
    PageType = CardPart;
    SourceTable = CustomerTableExt50101;
    ApplicationArea = All;
    Caption = 'Delivery Preferences';

    layout
    {
        area(content)
        {
            group(Group)
            {
                field("DeliveryTimePreference"; "DeliveryTimePreference")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("DeliveryInstructions"; "DeliveryInstructions")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("DeliveryContactName"; "DeliveryContactName")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("DeliveryContactPhone"; "DeliveryContactPhone")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }
}
