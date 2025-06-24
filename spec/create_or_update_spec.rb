# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CreateOrUpdate do
  it 'has a version number' do
    expect(CreateOrUpdate::VERSION).not_to be nil
  end

  describe '#print_identifiers' do
    let(:dummy_model) { DummyModel.new(unique_attribute: 'test_value', other_attribute: 'other_value') }

    context 'when no exclude parameter is provided' do
      it 'returns all identifiers with their values' do
        expect(dummy_model.print_identifiers).to eq('unique_attribute : test_value | other_attribute : other_value')
      end

      it 'returns empty string when identifier value is nil' do
        dummy_model.unique_attribute = nil
        expect(dummy_model.print_identifiers).to eq('unique_attribute :  | other_attribute : other_value')
      end
    end

    context 'when exclude parameter is provided' do
      it 'excludes specified attributes from output' do
        expect(dummy_model.print_identifiers(exclude: [:unique_attribute]))
          .to eq('other_attribute : other_value')
      end

      it 'ignores exclude attributes that are not identifiers' do
        expect(dummy_model.print_identifiers(exclude: [:non_existent_attribute]))
          .to eq('unique_attribute : test_value | other_attribute : other_value')
      end

      it 'handles empty exclude array' do
        expect(dummy_model.print_identifiers(exclude: []))
          .to eq('unique_attribute : test_value | other_attribute : other_value')
      end

      it 'handles exclude array with mixed valid and invalid attributes' do
        expect(dummy_model.print_identifiers(exclude: %i[unique_attribute non_existent]))
          .to eq('other_attribute : other_value')
      end
    end
  end

  describe '.create_or_update' do
    let(:unique_attribute) { 'unique_value' }
    let(:other_attribute) { 'other_value' }
    let(:new_other_attribute) { 'new_other_value' }

    context 'when no record matches the identifier' do
      it 'creates a new record with the given attributes' do
        expect do
          DummyModel.create_or_update(unique_attribute: unique_attribute, other_attribute: other_attribute)
        end.to change(DummyModel, :count).by(1)

        record = DummyModel.find_by(unique_attribute: unique_attribute)
        expect(record.other_attribute).to eq(other_attribute)
      end
    end

    context 'when a record matches the identifier' do
      before do
        DummyModel.create!(unique_attribute: unique_attribute, other_attribute: other_attribute)
      end

      it 'updates the existing record with new attributes' do
        expect do
          DummyModel.create_or_update(unique_attribute: unique_attribute, other_attribute: other_attribute,
                                      third_attribute: 'third_value')
        end.not_to change(DummyModel, :count)

        record = DummyModel.find_by(unique_attribute: unique_attribute)
        expect(record.other_attribute).to eq(other_attribute)
        expect(record.third_attribute).to eq('third_value')
      end
    end
  end
end
