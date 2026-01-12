tableextension 50101 CustomerTableExt50101 extends Customer
{
    fields
    {
        field(50100; DeliveryContactName; Text[50])
        {
            Caption = 'Delivery Contact Name';
            DataClassification = ToBeClassified;
        }
        field(50101; DeliveryInstructions; Text[250])
        {
            Caption = 'Delivery instructions';
            DataClassification = ToBeClassified;
        }
        field(50102; "DeliveryContactPhone"; Text[20])
        {
            Caption = 'Delivery Contact Phone';
            DataClassification = ToBeClassified;
        }
        field(50103; "DeliveryTimePreference"; Enum "DeliveryTimePreference")
        {
            caption = 'Delivery Time Preference';
            trigger OnValidate()
            begin
                if Rec.DeliveryTimePreference = Rec.DeliveryTimePreference::"0; Morning" then
                    Message('it will be deliverd shortly');
                if Rec.DeliveryTimePreference = Rec.DeliveryTimePreference::"1; Afternoon" then
                    Message('there is a high traffic it will be delivered within the time frame');
                if Rec.DeliveryTimePreference = Rec.DeliveryTimePreference::"2; Evening" then
                    Message('the delivery station is closed we can deliver tomorrow');
            end;


        }
    }
}