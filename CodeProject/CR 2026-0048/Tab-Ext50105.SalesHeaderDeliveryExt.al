tableextension 50105 SalesHeaderDeliveryExt extends "Sales Header"
{
    fields
    {
        field(50100; DeliveryContactName; Text[50])
        {
            Caption = 'Delivery Contact Name';
            DataClassification = CustomerContent;
        }
        field(50101; DeliveryInstructions; Text[250])
        {
            Caption = 'Delivery instructions';
            DataClassification = CustomerContent;
        }
        field(50102; DeliveryContactPhone; Text[20])
        {
            Caption = 'Delivery Contact Phone';
            DataClassification = CustomerContent;

        }
        field(50103; DeliveryTimePreference; Enum DeliveryTimePreference)
        {
            caption = 'Delivery Time Preference';
            DataClassification = CustomerContent;
        }
    }
}
