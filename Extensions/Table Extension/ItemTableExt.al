tableextension 60149 ItemExtension extends Item
{
    fields
    {
        field(80200; "Kode Produsen"; Text[20])
        {
            Caption = 'Kode Produsen';
            DataClassification = CustomerContent;
        }
        field(80201; "Negara Asal"; Code[3])
        {
            Caption = 'Negara Asal';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if StrLen("Negara Asal") <> 3 then
                    Error('Negara Asal harus terdiri dari 3 huruf.');
            end;
        }
    }
}