tableextension 50105 SalesHeaderDeliveryExt extends "Sales Header"
{
    fields
    {
        field(50100; DeliveryContactName; )
        {
            Caption = 'DeliveryContactName';
            DataClassification = ToBeClassified;
        }
        field(50101; DeliveryInstructions; )
        {
            Caption = 'DeliveryInstructions';
            DataClassification = ToBeClassified;
        }
        field(50102; DeliveryContactPhone; )
        {
            Caption = 'DeliveryContactPhone';
            DataClassification = ToBeClassified;
        }
        field(50103; DeliveryTimePreference; )
        {
            Caption = 'DeliveryTimePreference';
            DataClassification = t;
        }
    }
}
